document.addEventListener('DOMContentLoaded', () => {
  // --- DOM Elements ---
  const preloader = document.querySelector('.preloader');
  const preloaderContent = document.querySelector('.preloader-content');
  const vaultContainer = document.querySelector('.vault-perspective-container');
  const vaultDoor = document.querySelector('.vault-door');
  const mainContent = document.querySelector('.main-content');
  const handle = document.querySelector('.vault-handle');
  const scanner = document.querySelector('.fingerprint-scanner');
  const securityPanel = document.querySelector('.security-panel');
  const statusText = document.querySelector('.status-text');
  const instructions = document.querySelector('.vault-instructions p');
  const fingerprintLines = document.querySelector('.fingerprint-lines');
  const scanLine = document.querySelector('.scan-line');
  const successMark = document.querySelector('.success-mark');

  // --- State Variables ---
  let scanComplete = false;
  let isUnlocked = false;
  let scanTimeline; // To hold the GSAP timeline

  // --- Audio Synthesis ---
  const successSynth = new Tone.PolySynth(Tone.Synth, {
    volume: -8,
    oscillator: { type: 'sine' },
    envelope: { attack: 0.005, decay: 0.1, sustain: 0.3, release: 1 },
  }).toDestination();
  const boltSynth = new Tone.MetalSynth({
    frequency: 80,
    envelope: { attack: 0.001, decay: 0.1, release: 0.05 },
    harmonicity: 3.1,
    modulationIndex: 40,
    resonance: 3000,
    octaves: 1.5,
  }).toDestination();
  const doorSynth = new Tone.NoiseSynth({
    noise: { type: 'brown' },
    envelope: { attack: 0.1, decay: 1.4, sustain: 0, release: 0.1 },
  }).toDestination();
  const scannerSynth = new Tone.AMSynth({
    harmonicity: 1.5,
    envelope: { attack: 0.01, decay: 0.2, sustain: 0.1, release: 0.1 },
    modulationEnvelope: { attack: 0.1, decay: 0.1, sustain: 0.2, release: 0.1 },
  }).toDestination();
  const failSynth = new Tone.Synth({
    oscillator: { type: 'square' },
    envelope: { attack: 0.01, decay: 0.2, sustain: 0, release: 0.1 },
  }).toDestination();

  // --- Event Listeners ---
  scanner.addEventListener('mousedown', startScan);
  scanner.addEventListener('touchstart', startScan);
  scanner.addEventListener('mouseup', cancelScan);
  scanner.addEventListener('mouseleave', cancelScan);
  scanner.addEventListener('touchend', cancelScan);
  handle.addEventListener('click', handleHandleTurn);

  function startScan(e) {
    e.preventDefault();
    if (scanComplete || isUnlocked) return;

    scannerSynth.triggerAttack('C2');
    statusText.textContent = 'Scanning...';
    scanner.classList.add('scanning');

    // Create and play the GSAP timeline
    scanTimeline = gsap.timeline({
      onComplete: () => {
        scanSuccess();
      },
    });

    scanTimeline
      .to(scanLine, { opacity: 1, duration: 0.2 })
      .set(fingerprintLines, { filter: 'brightness(1.5)' })
      .to(
        fingerprintLines,
        {
          clipPath: 'polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)',
          duration: 2.0, // Slower scan for hold effect
          ease: 'power1.inOut',
        },
        '-=0.2'
      )
      .to(scanLine, { y: '80px', duration: 2.0, ease: 'power1.inOut' }, '<');
  }

  function cancelScan() {
    if (scanComplete || isUnlocked) return;
    if (scanTimeline && scanTimeline.isActive()) {
      scannerSynth.triggerRelease();
      failSynth.triggerAttackRelease('A2', '0.1', '+0.05');

      scanTimeline.kill();
      gsap.to([fingerprintLines, scanLine], {
        clearProps: 'all',
        duration: 0.3,
      });

      scanner.classList.add('fail');
      statusText.textContent = 'Scan Failed';

      setTimeout(() => {
        scanner.classList.remove('scanning');
        scanner.classList.remove('fail');
        statusText.textContent = 'Awaiting Scan';
      }, 1000);
    }
  }

  function scanSuccess() {
    if (scanComplete) return;
    scanComplete = true;
    scanner.style.cursor = 'default';
    scannerSynth.triggerRelease();

    const tl = gsap.timeline({ onComplete: activateHandle });

    tl.to(fingerprintLines, { filter: 'brightness(1)', duration: 0.3 })
      .to(scanLine, { opacity: 0, duration: 0.3 })
      .set(statusText, { textContent: 'Verified' })
      .fromTo(
        successMark,
        { scale: 0, opacity: 0 },
        { scale: 1, opacity: 1, duration: 0.5, ease: 'back.out(1.7)' }
      )
      .to(securityPanel, {
        opacity: 0,
        scale: 0.9,
        duration: 0.5,
        ease: 'power2.in',
        onComplete: () => {
          securityPanel.style.display = 'none';
        },
      })
      .fromTo(
        vaultContainer,
        { display: 'none', opacity: 0, scale: 0.9 },
        {
          display: 'block',
          opacity: 1,
          scale: 1,
          duration: 0.6,
          ease: 'power2.out',
        }
      );
  }

  function activateHandle() {
    successSynth.triggerAttackRelease(['C4', 'E4', 'G4'], '0.5', Tone.now());
    instructions.textContent = 'Click Handle to Open';
    handle.classList.add('active');
  }

  function handleHandleTurn() {
    if (!scanComplete || isUnlocked) return;
    isUnlocked = true;

    handle.classList.remove('active');

    const tl = gsap.timeline();
    tl.to(
      handle,
      {
        rotation: 120,
        duration: 0.5,
        ease: 'power2.inOut',
      },
      '-=0.2'
    )
      .call(() => boltSynth.triggerAttackRelease('C2', '0.2', Tone.now()))
      .call(openDoor);

    securityPanel.style.display = 'none';
  }

  function openDoor() {
    doorSynth.triggerAttack(Tone.now());

    vaultDoor.classList.add('is-unlocked');
    setTimeout(() => {
      mainContent.style.display = 'block';

      const revealTl = gsap.timeline({
        onComplete: () => {
          setTimeout(() => preloader.remove(), 500);
        },
      });

      revealTl
        .to(preloaderContent, {
          scale: 15,
          duration: 1.0,
          ease: 'power3.in',
        })
        .to(mainContent, {
          opacity: 1,
          duration: 1.0,
          ease: 'power1.out',
        })
        .to(
          preloader,
          {
            opacity: 0,
            duration: 0.5,
          },
          '<'
        );
    }, 600);
  }
});