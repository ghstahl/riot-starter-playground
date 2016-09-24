import './components/sidebar-layout.tag';

<app>
    <sidebar-layout menuItems={this.menuItems}>
        <yield to="content">
            <div id="riot-subview"></div>
        </yield>
    </sidebar-layout>


    <script >
        this.on('mount', function(){

            console.log('app Mounted') // Succeeds, fires once (per mount)
        })
        this.menuItems = [
            {name:'Name 1',href:'#home',view : 'home'},
            {name:'Name 2',href:'#projects',view : 'projects'}
        ]
    </script>

</app>
