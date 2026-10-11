Welcome to the "Dindigul Police Digital Case Management Platform (DCMP)" GitHub Repository! <br />

This repository hosts a comprehensive Database Management System (DBMS) project aimed at enhancing crime record management and analysis. Our project is designed to streamline the process of recording, organizing, and analyzing criminal activities, ensuring a more efficient and data-driven approach for law enforcement agencies. <br />

Key Features: <br />
  <br />
  New in this version <br /><br />
    Modern responsive UI (shared theme in assets/css/modern.css, new login page, top navigation) <br />
    Analytics dashboard with live statistics and charts (admin, DGP Office, CID) <br />
    Evidence &amp; crime scene photo gallery per case: upload, categorise, view in lightbox, delete. Photos are stored in uploads/evidence (blocked from direct web access) and served only to logged-in staff. The case_evidence table is     created automatically on first use. <br />
        Case resolution for completed cases: how the case was solved (remarks) plus accused details with photo (stored in uploads/accused). Editable by Admin and the assigned CID officer, visible to all roles. <br />
    CID Performance Report (Admin and DGP Office, "Reports" menu): cases assigned, solved, pending, solve rate and average days to solve per CID officer, with charts, date filter, CSV export and print. <br />
    Demo data: 10 CID officers and ~165 cases with complaints, investigations, resolutions and accused records are included in the SQL dump (DB File/seed_demo_data.sql is the same seed, for adding to an existing database). <br /><br />
      Admin <br /><br />
    Admin Dashboard <br />
    View Staff List <br />
    Assign case to CID Officer <br />
    Manage Account <br /><br /><br />
  DGP Office<br /><br />
    DGP Office Dashboard <br />
    Register a Complain <br />
    View list of complains <br />
    View details of case investigation <br />
    Assign a case CID Officer <br />
    Manage Account/Change Password <br /><br /><br />
  CID<br /><br />
    CID Dashboard <br />
    View list of cases assigned <br />
    View details of case investigation <br />
    Write a report on the case being investigated <br />
    Manage Account/Change Password <br /><br /><br />

Technologies Used: Our project employs a robust tech stack including PHP, HTML, JavaScript, CSS, and MySQL. PHP ensures dynamic data processing, while HTML and CSS contribute to the user-friendly interface. JavaScript enhances interactivity and a smooth user experience. MySQL acts as the backend database, ensuring secure data storage and retrieval. <br />

Efficient Data Management: With the integration of MySQL, our system ensures secure and structured storage of crime-related information. The relational database design facilitates seamless data manipulation, reporting, and analysis. <br />

Responsive Design: Our user interfaces are designed with responsiveness in mind, ensuring optimal performance across various devices and screen sizes.<br />

We believe that efficient crime record management is crucial for effective law enforcement, and our "Dindigul Police Digital Case Management Platform (DCMP)" project is a step in that direction. By combining cutting-edge technologies and a user-centered approach, we aim to revolutionize the way crime data is handled and analyzed. We invite you to explore, contribute, and collaborate to make our criminal justice system more effective and data-driven.<br />

Feel free to contribute, provide feedback, and join us on this journey towards improving crime record management!<br />

Tech Stack:<br />
PHP<br />
HTML<br />
JavaScript<br />
CSS<br />
MySQL <br />
<br />
--How to Run--<br />
<br />
Requirements<br />
<br />
<ul>
<li> Download and Install any local web server such as XAMPP/WAMP.</li>
<li> Download the provided source code zip file. (download button is located below. </li>
<li> Installation/Setup </li>
</ul>

<br />
1.Open your XAMPP/WAMP's Control Panel and start the Apache and MySQL.<br /><br />
2.Extract the downloaded source code zip file.<br /><br />
3.If you are using XAMPP, copy the extracted source code folder and paste it into the XAMPP's "htdocs" directory. And If you are using WAMP, paste it into the "www" directory.<br /><br />
4.Browse the PHPMyAdmin in a browser. i.e. http://localhost/phpmyadmin<br /><br />
5.Create a new database naming dindigulpolice.<br /><br />
6.Import the provided SQL file. The file is known as ghpolice.sql located inside the DB File folder.<br /><br />
7.Browse the Dindigul Police Digital Case Management Platform (DCMP) in a browser. i.e. http://localhost/dindigulpolice.<br /><br />
<br />

Default password for every account is <staffid>@Dgl2026 (change after first login). Roles: Admin, DGP Office, CID. Existing databases: run DB File/migration_dgp_role_and_passwords.sql.<br /><br />
Admin 
------
100 - djain123  <br />
101 - 101@Dgl2026 <br />


DGP Office
-----
113 - 113@Dgl2026 <br />
114 - 114@Dgl2026 <br />
117 - 117@Dgl2026 <br />


CID
------
115 - 115@Dgl2026 <br />
116 - 116@Dgl2026 <br />
110 - 110@Dgl2026 <br />
