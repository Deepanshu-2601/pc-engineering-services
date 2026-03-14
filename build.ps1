$html = Get-Content index.html -Raw
$start = $html.IndexOf('<main>')
$end = $html.IndexOf('<!-- Advanced 4-Column Corporate Footer -->')
$head = $html.Substring(0, $start)
# Remove the active class from home link to prevent multiple glowing links
$head = $head.Replace('<a href="#home">HOME</a>', '<a href="index.html">HOME</a>')
$head = $head.Replace('<a href="#about">ABOUT</a>', '<a href="about.html">ABOUT</a>')
$head = $head.Replace('<a href="#contact">CONTACT US</a>', '<a href="contact.html">CONTACT US</a>')

$foot = $html.Substring($end)

$about_content = @"
    <main>
        <!-- About Us Hero -->
        <section class="page-hero" style="background: var(--text-dark); padding: 8rem 0 4rem; color: #fff; text-align: center;">
            <div class="container">
                <span class="badge" style="background: rgba(249, 115, 22, 0.2); color: var(--accent-primary); margin-bottom: 1rem; padding: 0.5rem 1rem; border-radius: 50px; font-weight: 600; font-size: 0.85rem; letter-spacing: 1px; display: inline-block;">ESTABLISHED 2019</span>
                <h1 style="font-size: 3.5rem; margin-bottom: 1.5rem;">About <span class="text-orange">PC Engineering Service</span></h1>
                <p style="font-size: 1.2rem; color: #a0aec0; max-width: 700px; margin: 0 auto; line-height: 1.7;">Pioneering Technical Staffing, Architectual Design, and Manpower Outsourcing since our inception in New Delhi. We deliver the specialized talent required to execute the world's most complex projects.</p>
            </div>
        </section>

        <!-- Company Mission & Vision -->
        <section style="padding: 5rem 0; background: #fff;">
            <div class="container grid" style="grid-template-columns: 1fr 1fr; gap: 4rem; align-items: center;">
                <div>
                    <h2 class="section-title">Our <span class="text-orange">Mission</span> & Vision</h2>
                    <p style="font-size: 1.1rem; color: var(--text-muted); line-height: 1.8; margin-bottom: 1.5rem;">Since 2019, PC Engineering Service has dedicated itself to delivering world-class engineering, architectural design, and highly vetted manpower outsourcing to global industries. We started in Delhi and rapidly grew our presence to cover major locations across India.</p>
                    <p style="font-size: 1.1rem; color: var(--text-muted); line-height: 1.8;">Our vision is to bridge the gap between technical megaprojects and the specialized talent required to execute them with perfection. Easing the operational burden on your teams is our paramount goal.</p>
                </div>
                <div class="clean-panel" style="background: var(--bg-alt); padding: 3rem; border-left: 5px solid var(--accent-primary);">
                    <h3 style="font-size: 1.8rem; margin-bottom: 1.5rem; color: var(--text-dark);">Core Values</h3>
                    <ul style="list-style: none; padding: 0; display: flex; flex-direction: column; gap: 1.2rem;">
                        <li style="display: flex; gap: 1rem; align-items: center;"><i class="ti ti-check text-orange" style="font-size: 1.5rem;"></i><span style="font-size: 1.1rem; font-weight: 600; color: var(--text-dark);">Uncompromising Quality</span></li>
                        <li style="display: flex; gap: 1rem; align-items: center;"><i class="ti ti-check text-orange" style="font-size: 1.5rem;"></i><span style="font-size: 1.1rem; font-weight: 600; color: var(--text-dark);">Technical Excellence</span></li>
                        <li style="display: flex; gap: 1rem; align-items: center;"><i class="ti ti-check text-orange" style="font-size: 1.5rem;"></i><span style="font-size: 1.1rem; font-weight: 600; color: var(--text-dark);">Integrity & Transparency</span></li>
                        <li style="display: flex; gap: 1rem; align-items: center;"><i class="ti ti-check text-orange" style="font-size: 1.5rem;"></i><span style="font-size: 1.1rem; font-weight: 600; color: var(--text-dark);">Rapid Deployment</span></li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Leadership Team -->
        <section style="padding: 5rem 0; background: var(--bg-light);">
            <div class="container" style="text-align: center;">
                <h2 class="section-title" style="margin-bottom: 3rem;">Our <span class="text-orange">Leadership</span></h2>
                <div class="grid" style="grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 3rem;">
                    <div class="clean-panel" style="padding: 2.5rem 1.5rem;">
                        <div style="width: 120px; height: 120px; border-radius: 50%; background: #e2e8f0; margin: 0 auto 1.5rem; overflow: hidden; display: flex; justify-content: center; align-items: center;">
                            <i class="ti ti-user-circle" style="font-size: 5rem; color: var(--text-muted);"></i>
                        </div>
                        <h4 style="font-size: 1.3rem; margin-bottom: 0.5rem; color: var(--text-dark);">Rahul Sharma</h4>
                        <p class="text-orange" style="font-weight: 600; margin-bottom: 1rem;">Managing Director</p>
                        <p style="color: var(--text-muted); font-size: 0.95rem;">Over 15 years of operational excellence in technical staffing.</p>
                    </div>
                    <div class="clean-panel" style="padding: 2.5rem 1.5rem;">
                        <div style="width: 120px; height: 120px; border-radius: 50%; background: #e2e8f0; margin: 0 auto 1.5rem; overflow: hidden; display: flex; justify-content: center; align-items: center;">
                            <i class="ti ti-user-circle" style="font-size: 5rem; color: var(--text-muted);"></i>
                        </div>
                        <h4 style="font-size: 1.3rem; margin-bottom: 0.5rem; color: var(--text-dark);">Priya Desai</h4>
                        <p class="text-orange" style="font-weight: 600; margin-bottom: 1rem;">Head of Operations</p>
                        <p style="color: var(--text-muted); font-size: 0.95rem;">Pioneering our rapid deployment protocols across India.</p>
                    </div>
                    <div class="clean-panel" style="padding: 2.5rem 1.5rem;">
                        <div style="width: 120px; height: 120px; border-radius: 50%; background: #e2e8f0; margin: 0 auto 1.5rem; overflow: hidden; display: flex; justify-content: center; align-items: center;">
                            <i class="ti ti-user-circle" style="font-size: 5rem; color: var(--text-muted);"></i>
                        </div>
                        <h4 style="font-size: 1.3rem; margin-bottom: 0.5rem; color: var(--text-dark);">Amit Patel</h4>
                        <p class="text-orange" style="font-weight: 600; margin-bottom: 1rem;">Director of Engineering</p>
                        <p style="color: var(--text-muted); font-size: 0.95rem;">Leading the architectural design and structural divisions.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
"@

$contact_content = @"
    <main>
        <!-- Contact Hero -->
        <section class="page-hero" style="background: var(--text-dark); padding: 8rem 0 4rem; color: #fff; text-align: center;">
            <div class="container">
                <h1 style="font-size: 3.5rem; margin-bottom: 1.5rem;">Get In <span class="text-orange">Touch</span></h1>
                <p style="font-size: 1.2rem; color: #a0aec0; max-width: 700px; margin: 0 auto; line-height: 1.7;">Our teams in New Delhi and Mumbai are ready to accelerate your engineering projects. Build your dream team with us today.</p>
            </div>
        </section>

        <!-- Contact Options -->
        <section style="padding: 5rem 0; background: var(--bg-light);">
            <div class="container grid" style="grid-template-columns: 1fr 1.5fr; gap: 4rem;">
                <!-- Info -->
                <div style="display: flex; flex-direction: column; gap: 2rem;">
                    <div class="clean-panel" style="padding: 2.5rem; border-left: 4px solid var(--accent-primary);">
                        <h3 style="margin-bottom: 1rem; color: var(--text-dark); display: flex; align-items: center; gap: 0.5rem;"><i class="ti ti-map-pin text-orange" style="font-size: 1.8rem;"></i> Head Office (Delhi)</h3>
                        <p style="color: var(--text-muted); line-height: 1.8; font-size: 1.05rem;">123 Connaught Place,<br>New Delhi, Delhi 110001<br>India</p>
                        <p style="margin-top: 1.5rem; font-weight: 600; font-size: 1.1rem; color: var(--text-dark);"><i class="ti ti-phone text-orange"></i> +91 11 2345 6789</p>
                        <p style="margin-top: 0.5rem; font-weight: 600; font-size: 1.1rem; color: var(--text-dark);"><i class="ti ti-mail text-orange"></i> contact@pcengineering.com</p>
                    </div>
                    <div class="clean-panel" style="padding: 2.5rem; border-left: 4px solid var(--text-slate);">
                        <h3 style="margin-bottom: 1rem; color: var(--text-dark); display: flex; align-items: center; gap: 0.5rem;"><i class="ti ti-building text-orange" style="font-size: 1.8rem;"></i> Mumbai Branch</h3>
                        <p style="color: var(--text-muted); line-height: 1.8; font-size: 1.05rem;">45 Bandra Kurla Complex,<br>Mumbai, Maharashtra 400051<br>India</p>
                        <p style="margin-top: 1.5rem; font-weight: 600; font-size: 1.1rem; color: var(--text-dark);"><i class="ti ti-phone text-orange"></i> +91 22 9876 5432</p>
                    </div>
                </div>
                
                <!-- Form -->
                <div class="clean-panel" style="padding: 3.5rem;">
                    <h2 style="margin-bottom: 2.5rem; color: var(--text-dark);">Send Us a Message</h2>
                    <form onsubmit="event.preventDefault(); alert('Message sent successfully!');" style="display: flex; flex-direction: column; gap: 1.5rem;">
                        <div class="grid" style="grid-template-columns: 1fr 1fr; gap: 1.5rem;">
                            <div>
                                <label style="display: block; margin-bottom: 0.5rem; font-weight: 600; color: var(--text-dark);">First Name</label>
                                <input type="text" placeholder="John" class="form-input" style="width: 100%; border: 1px solid var(--border-color); padding: 1rem; border-radius: 8px; font-family: inherit;" required>
                            </div>
                            <div>
                                <label style="display: block; margin-bottom: 0.5rem; font-weight: 600; color: var(--text-dark);">Last Name</label>
                                <input type="text" placeholder="Doe" class="form-input" style="width: 100%; border: 1px solid var(--border-color); padding: 1rem; border-radius: 8px; font-family: inherit;" required>
                            </div>
                        </div>
                        <div>
                            <label style="display: block; margin-bottom: 0.5rem; font-weight: 600; color: var(--text-dark);">Business Email</label>
                            <input type="email" placeholder="john@company.com" class="form-input" style="width: 100%; border: 1px solid var(--border-color); padding: 1rem; border-radius: 8px; font-family: inherit;" required>
                        </div>
                        <div>
                            <label style="display: block; margin-bottom: 0.5rem; font-weight: 600; color: var(--text-dark);">Service Category</label>
                            <select class="form-input" style="width: 100%; border: 1px solid var(--border-color); padding: 1rem; border-radius: 8px; font-family: inherit;" required>
                                <option value="">Select an option...</option>
                                <option value="hr">Manpower Outsourcing (HR)</option>
                                <option value="tech">Technical/IT Staffing</option>
                                <option value="arch">Architectural Design Solutions</option>
                                <option value="gen">General Inquiry</option>
                            </select>
                        </div>
                        <div>
                            <label style="display: block; margin-bottom: 0.5rem; font-weight: 600; color: var(--text-dark);">Message</label>
                            <textarea placeholder="How can we help you?" rows="5" style="width: 100%; border: 1px solid var(--border-color); padding: 1rem; border-radius: 8px; font-family: inherit; resize: vertical;" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" style="padding: 1.2rem; font-size: 1.1rem; margin-top: 1rem; display: flex; justify-content: center; gap: 0.5rem;"><i class="ti ti-send"></i> Submit Inquiry</button>
                    </form>
                </div>
            </div>
        </section>
    </main>
"@

$about_html = $head + $about_content + "`n" + $foot
$about_html | Set-Content about.html -Encoding UTF8

$head_contact = $html.Substring(0, $start)
$head_contact = $head_contact.Replace('<a href="#home">HOME</a>', '<a href="index.html">HOME</a>')
$head_contact = $head_contact.Replace('<a href="#about">ABOUT</a>', '<a href="about.html">ABOUT</a>')
$head_contact = $head_contact.Replace('<a href="#contact">CONTACT US</a>', '<a href="contact.html">CONTACT US</a>')

$contact_html = $head_contact + $contact_content + "`n" + $foot
$contact_html | Set-Content contact.html -Encoding UTF8

Write-Output "Successfully generated about.html and contact.html!"
