import './loading-indicator.tag';
import './nav-bar.tag';
import './sidebar-layout.css';

<sidebar-layout>
    <loading-indicator></loading-indicator>

    <div id="wrapper" class="toggled">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">

                <li>
                    <a href="#">Dashboard</a>
                </li>
                <li>
                    <a href="#">Shortcuts</a>
                </li>
                <li>
                    <a href="#">Overview</a>
                </li>
                <li>
                    <a href="#">Events</a>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
        <nav-bar>
            <yield to="hamburger-li">
                <li><a href="#" onclick={parent.toggle}><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a></li>
            </yield>
        </nav-bar>
        <!-- Page Content -->
        <div id="page-content-wrapper">

            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-12">
                        <yield from="content"/>
                        <h1>Simple Sidebar</h1>
                        <p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>
                        <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle" onclick={toggle}>Toggle Menu</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    this.toggle = (e) => {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    }

</sidebar-layout>


