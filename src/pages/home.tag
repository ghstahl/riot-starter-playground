import '../components/itemlist.tag';
import 'whatwg-fetch';

<home>
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
      } else if (this.lastSearch != search && search.length > 1)  {
        this.resetData()
        this.isLoading = true
        this.doApiRequest(search)
      }

      this.lastSearch = search
    }
  </script>

</home>
