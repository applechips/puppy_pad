<style>
header {
  text-align: center;
}
/*img {
  text-align: center;
  padding-top: 70px;
  max-width:100%;
  max-height:100%;
}*/
.navbar-default {
  background-color: white;
  border-color: rgba(34, 34, 34, 0.05);
  -webkit-transition: all 0.35s;
  -moz-transition: all 0.35s;
  transition: all 0.35s;
  font-family: 'Catamaran', 'Helvetica', 'Arial', 'sans-serif';
  font-weight: 200;
  letter-spacing: 1px;
}
.navbar-default .navbar-header .navbar-brand {
  font-family: 'Catamaran', 'Helvetica', 'Arial', 'sans-serif';
  font-weight: 200;
  letter-spacing: 1px;
  color: #fdcc52;
}
.navbar-default .navbar-header .navbar-brand:hover,
.navbar-default .navbar-header .navbar-brand:focus {
  color: #fcbd20;
}
.navbar-default .navbar-header .navbar-toggle {
  font-size: 12px;
  color: #222222;
  padding: 8px 10px;
}
.navbar-default .nav > li > a {
  font-family: 'Lato', 'Helvetica', 'Arial', 'sans-serif';
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 11px;
}
.navbar-default .nav > li > a,
.navbar-default .nav > li > a:focus {
  color: #222222;
}
.navbar-default .nav > li > a:hover,
.navbar-default .nav > li > a:focus:hover {
  color: #fdcc52;
}
.navbar-default .nav > li.active > a,
.navbar-default .nav > li.active > a:focus {
  color: #fdcc52 !important;
  background-color: transparent;
}
.navbar-default .nav > li.active > a:hover,
.navbar-default .nav > li.active > a:focus:hover {
  background-color: transparent;
}
@media (min-width: 768px) {
  .navbar-default {
    background-color: transparent;
    border-color: transparent;
  }
  .navbar-default .navbar-header .navbar-brand {
    color: rgba(255, 255, 255, 0.7);
  }
  .navbar-default .navbar-header .navbar-brand:hover,
  .navbar-default .navbar-header .navbar-brand:focus {
    color: white;
  }
  .navbar-default .nav > li > a,
  .navbar-default .nav > li > a:focus {
    color: rgba(255, 255, 255, 0.7);
  }
  .navbar-default .nav > li > a:hover,
  .navbar-default .nav > li > a:focus:hover {
    color: white;
  }
  .navbar-default.affix {
    background-color: white;
    border-color: rgba(34, 34, 34, 0.1);
  }
  .navbar-default.affix .navbar-header .navbar-brand {
    color: #222222;
  }
  .navbar-default.affix .navbar-header .navbar-brand:hover,
  .navbar-default.affix .navbar-header .navbar-brand:focus {
    color: #fdcc52;
  }
  .navbar-default.affix .nav > li > a,
  .navbar-default.affix .nav > li > a:focus {
    color: #222222;
  }
  .navbar-default.affix .nav > li > a:hover,
  .navbar-default.affix .nav > li > a:focus:hover {
    color: #fdcc52;
  }
}

</style>

<div class="container">
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span><i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">PUPPY PAD</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                      <%= link_to "Login", new_session_path, { :class => "page-scroll"}, , data: {popup_open: "modal"} %>

                      <div class='popup-1 modal' data-popup="modal" id='popup'>
                    <div class='popup-inner'>
                      
                        <p>
                            <a data-popup-close="modal" href="#"></a>
                        </p>
                        <a class="popup-close" data-popup-close="modal" href="#">x</a>
                    </div>
                </div>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
</nav>
</div>

<header>
  <div class="background-container">
    <img src="https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/93a91240649039.579107869ed86.jpg">
    <div class="row">
        <div class="header-content">
          <!-- <div class="header-content-inner">
              <h1>Do You Have A Dog?</h1>
              <a href="#download" class="btn btn-outline btn-xl page-scroll">Yes</a>
              <a href="#download" class="btn btn-outline btn-xl page-scroll">No</a>
          </div> -->

        </div>

    </div>
  </div>
</header>
