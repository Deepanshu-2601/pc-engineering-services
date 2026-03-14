// script.js

document.addEventListener('DOMContentLoaded', () => {

    // 1. Mobile Menu Toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const navLinks = document.querySelector('.nav-links');
    const menuIcon = document.querySelector('.menu-toggle i');

    if (menuToggle && navLinks) {
        menuToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            if (navLinks.classList.contains('active')) {
                menuIcon.classList.remove('ti-menu-2');
                menuIcon.classList.add('ti-x');
            } else {
                menuIcon.classList.remove('ti-x');
                menuIcon.classList.add('ti-menu-2');
            }
        });

        // Close menu when a link is clicked
        const links = navLinks.querySelectorAll('a');
        links.forEach(link => {
            link.addEventListener('click', () => {
                navLinks.classList.remove('active');
                menuIcon.classList.remove('ti-x');
                menuIcon.classList.add('ti-menu-2');
            });
        });
    }

    // 2. Sticky Navbar on Scroll
    const navbar = document.querySelector('.navbar');
    
    const handleScroll = () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    };

    window.addEventListener('scroll', handleScroll);
    handleScroll(); // Check on init

    // 3. Scroll Animations using Intersection Observer
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.15
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                // Optional: Stop observing once animated in
                // observer.unobserve(entry.target); 
            }
        });
    }, observerOptions);

    // Select elements to animate
    const animateElements = document.querySelectorAll('.fade-in-up, .fade-in-left');
    
    animateElements.forEach(el => {
        observer.observe(el);
    });

    // 4. Set Image Source Fallbacks specifically if images aren't loaded correctly 
    // (This is a safety measure in case the rename/move operation has pathing issues)
    
    // Using an array to track our actual paths versus what might be expected
    const expectedImages = [
        { id: 'heroImage', src: 'assets/hero_workforce_1773213253842.png', altSource: 'assets/hero_workforce.png' },
        { id: 'itImage', src: 'assets/hero_workforce_1773213253842.png', altSource: 'assets/hero_workforce.png' },
        { id: 'solarImage', src: 'assets/hero_workforce_1773213253842.png', altSource: 'assets/hero_workforce.png' },
        { id: 'analystImage', src: 'assets/analyst_team_1773213286482.png', altSource: 'assets/analyst_team.png' },
        { id: 'pmImage', src: 'assets/pm_leadership_1773213314677.png', altSource: 'assets/pm_leadership.png' }
    ];

    expectedImages.forEach(imgData => {
        const imgElement = document.getElementById(imgData.id);
        if (imgElement) {
            imgElement.onerror = function() {
                // If the explicit filename fails, try to fallback to a simpler filename 
                // if we were to rename them during the folder move in a later iteration.
                console.warn(`Failed to load image: ${imgData.src}`);
            };
        }
    });

    // 5. Statistics Counter Animation
    const statsObserverOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.5 // Start animation when 50% of the stat section is visible
    };

    const statsObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const counters = entry.target.querySelectorAll('.stat-number');
                const speed = 200; // The lower the slower

                counters.forEach(counter => {
                    const updateCount = () => {
                        const target = +counter.getAttribute('data-target');
                        const count = +counter.innerText;

                        // Lower inc to slow and higher to fast
                        const inc = target / speed;

                        // Check if target is reached
                        if (count < target) {
                            // Add inc to count and output in counter
                            counter.innerText = Math.ceil(count + inc);
                            // Call function every ms
                            setTimeout(updateCount, 1);
                        } else {
                            counter.innerText = target;
                        }
                    };

                    updateCount();
                });
                
                // Unobserve after animating once
                observer.unobserve(entry.target);
            }
        });
    }, statsObserverOptions);

    // 6. Professional Form Handling (Formspree AJAX)
    const handleFormSubmit = (formId, statusId) => {
        const form = document.getElementById(formId);
        const status = document.getElementById(statusId);

        if (form && status) {
            form.addEventListener('submit', async (e) => {
                e.preventDefault();
                const formData = new FormData(form);
                
                // Show loading state
                const submitBtn = form.querySelector('button[type="submit"]');
                const originalBtnText = submitBtn.innerHTML;
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="ti ti-loader-2 rotate"></i> Sending...';

                try {
                    const response = await fetch(form.action, {
                        method: 'POST',
                        body: formData,
                        headers: { 'Accept': 'application/json' }
                    });

                    if (response.ok) {
                        status.innerHTML = "✨ <b>Success!</b> Your request has been sent. We will contact you shortly.";
                        status.style.color = "#059669";
                        status.style.display = "block";
                        form.reset();
                    } else {
                        throw new Error();
                    }
                } catch (error) {
                    status.innerHTML = "❌ <b>Oops!</b> There was a problem. Please email us directly at contact@pcengineering.com";
                    status.style.color = "#dc2626";
                    status.style.display = "block";
                } finally {
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalBtnText;
                    
                    // Hide message after 8 seconds
                    setTimeout(() => {
                        status.style.display = 'none';
                    }, 8000);
                }
            });
        }
    };

    handleFormSubmit('hire-talent-form', 'form-status');
    handleFormSubmit('main-contact-form', 'contact-status');

});
