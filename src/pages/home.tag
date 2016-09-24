import '../components/header.tag';
import '../components/itemlist.tag';
import '../components/sidebar-layout.tag';
import 'whatwg-fetch';

<home>
  <sidebar-layout>
    <yield to="content">
      <itemlist title="Item List ABC"></itemlist>
      <form onsubmit={ search }>
        <label>
          <span>
            Search a movie
          </span>
          <input
                    oninput={ search }
                    onchange={ search }
                    name='s'
                    placeholder='28 Days Later..'
                    type='search' />
          </label>
        <button  class="btn btn-default" onclick={parent.search}>Submit</button>
        </form>

          <div if={ isLoading } class='loader'>
            <img src='puff.svg' />
          </div>

          <p class='error' if={ error }>{ error }</p>

          <div if={ results.length }>
            <ul>
              <li each={ results }>
                <a href="http://www.imdb.com/title/{ imdbID }" target="_blank">{ Title }</a>
                <span>{ Year }</span>
              </li>
            </ul>
          </div>

    </yield>
  </sidebar-layout>
  <header></header>

  <script >
    this.lastSearch = null;
    this.error = false;
    this.results = [];
    /**
     * Reset tag attributes to hide the errors and cleaning the results list
     */
    this.resetData = function() {
      this.results = [];
      this.error = false;
    }
    /**
     * Debounce the api requests
     */
    this.doApiRequest = function(search) {
      var url = 'http://www.omdbapi.com/?s=' + search;
      fetch(url).then(function (response) {
        return response.json();
      }).then(function (data) {
        console.log(data);
      }).catch(function () {
        console.log("Booo");
      });

    }
    /**
     * Public api/methods
     */



    /**
     * Search callback
     */
    this.search = function(e) {

      var search = this.s.value

      if (!search) {
        this.resetData()
      } else if (this.lastSearch != search)  {
        this.parent.resetData()
        this.parent.isLoading = true
        this.parent.doApiRequest(search)
      }

      this.parent.lastSearch = search
    }
  </script>

</home>
