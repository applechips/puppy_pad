
<div id="navbar-styling">
  <div class="container">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span><i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="#page-top">PUPPY PAD</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">

                        <li>
                          <%= link_to "Sign Up", new_user_path, class:"page-scroll" %>
                        </li>
                        <li>
                          <%= link_to "Login", "", id: "login", data: {toggle:"modal", target: "#myModal"}, class:"page-scroll" %>
                          <%#= link_to "Login", new_session_path %>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
    </nav>
  </div>












-------------------
ROD LOGIN

<div>
  <img src="/puppypad.png">
</div>
  <span>
  <h2>Sign In</h2>
  <br>
  <%= flash[:alert] %>

  <%= form_tag sessions_path do %>

    <div class='form-group'>
      <div class='row'>
        <div class='col-sm-offset-4 col-sm-4'>
          <div class='input-group'>
            <div class='input-group-addon'>
              <i class='glyphicon glyphicon-user'></i>
            </div>
            <%= email_field_tag :email, nil, class:'form-control'%>
          </div>
        </div>
      </div>
    </div>

    <div class='form-group'>
      <div class='row'>
        <div class='col-sm-offset-4 col-sm-4'>
          <div class='input-group'>
            <div class='input-group-addon'>
              <i class='glyphicon glyphicon-user'></i>
            </div>
            <%= password_field_tag :password, nil, class:'form-control'%>
          </div>
        </div>
      </div>
    </div>

    <div class='form-group'>
      <div class='row'>
        <div class='col-sm-offset-4 col-sm-4'>
          <%= submit_tag 'Sign In', class:'btn btn-primary'%>
        </div>
      </div>
    </div>

  <%end%>

-------------

geolocation

var handler = Gmaps.build('Google');
handler.buildMap({ internal: {id: 'geolocation'} }, function(){
  // be aware chrome >= 50 requires https for geolocation to work
  if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition(displayOnMap);
});

function displayOnMap(position){
  var marker = handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  handler.map.centerOn(marker);
};

-----    

3663 Park Rd, North Vancouver, BC

---
 <%= f.label :caption, :class => 'control-label' %>
------
new.html.erb

<%= simple_form_for @pet_photo, url: pet_pet_photos_path, :method => 'post' do |f| %>
  <%= f.input :caption %>
  <%= f.input :date, as: :date, start_year: Date.today.year - 10,
                             end_year: Date.today.year, discard_day: false,
                             order: [:day, :month, :year] %>
  <%= f.input :address, :placeholder => "Address, City, Province" %>
  <%= f.file_field :images, required: true, multiple: true %>



  <%= f.button :submit, "Save" %>
<% end %>

----
in controller
render layout: "whatever you named it"

<%= render partial: "/layouts/whateveryounamedit" %>
-----

index.html.erb

<h1>Puppy Pad</h1>

<% @pets.each do |p| %>
  <%= link_to p.name, pet_path(p) %>
  <hr>
<% end %>


--------------
<h1>Sign Up</h1>
<% if @user.errors.any? %>
  <ul>
    <% @user.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
  </ul>
<% end %>

<%= form_for @user do |f| %>
<div>
  <%= f.label :first_name %>
  <%= f.text_field :first_name %>
</div>
<div>
  <%= f.label :last_name %>
  <%= f.text_field :last_name %>
</div>
<div>
  <%= f.label :email %>
  <%= f.email_field :email %>
</div>
<div>
  <%= f.label :password %>
  <%= f.password_field :password %>
</div>
<div>
  <%= f.label :password_confirmation %>
  <%= f.password_field :password_confirmation %>
</div>
<%= f.submit %>
<% end %>

----

<%= @date.to_s.html_safe %>

---
<%= link_to "Home", root_path %>
|
<%#= link_to "Map", pet_photo_map_path(@pet, @photo_map) %>
<% if user_signed_in? %>
  <%= link_to "Add a Pet", new_pet_path %>
  |

  Hello <%= current_user.full_name %>,
  <%= link_to "Logout", sessions_path, method: :delete,
           data: {confirm: "are you sure you want to log out?"}%>
<% else %>
  <%= link_to "Login", new_session_path %> |
  <%#= link_to "Sign in with Facebook", "/auth/facebook", id: "sign_in" %>
  <%= link_to "Sign Up", new_user_path %>
<% end %>



SHOW.

Pets#Show

<%= image_tag @pet.image.url(:medium), wrapper_html: { id: 'profile-pic' }%>

<h1>Welcome, <%= @pet.name%>!</h1>

<%= link_to "Edit Info", edit_pet_path(@pet) %>


show.html.erb

<div class="wrapper">
  <div class="main-panel" id="main-content">
    <!-- <nav class="navbar navbar-default"> -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
            <%= image_tag @pet.image.url(:medium),  wrapper_html: { id: 'profile_pic' }%>

            <h1>Welcome, <%= @pet.name%>!</h1>

            <%= link_to "Edit Info", edit_pet_path(@pet) %>

              </div>
            </div>
          </div>
        </div>
      </div>
    <!-- </nav> -->
  </div>
</div>


--------------
<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

      <div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://localhost:3000" class="simple-text">
                    PUPPY PAD
                </a>
            </div>

            <ul class="nav" >
                <li class="active">
                    <a href="/pets/3">
                        <i class="ti-user"></i>
                        <p>Archie</p>
                    </a>
                </li>
                <li>
                    <a href="/pets/6">
                        <i class="ti-user"></i>
                        <p>Bijou</p>
                    </a>
                </li>
                <li>
                    <a href="/pets/5">
                        <i class="ti-user"></i>
                        <p>Morty</p>
                    </a>
                </li>
                <li>
                    <!-- <a href="user.html"> -->
                    <%= link_to "HEALTH", pet_medical_records_path(@pet, @medical_record)  %>
                        <i class="ti-user"></i>

                    </a>
                </li>
                <li>
                    <a href="table.html">
                        <i class="ti-view-list-alt"></i>
                        <p>Places</p>
                    </a>
                </li>
                <li>
                    <a href="typography.html">
                        <i class="ti-text"></i>
                        <p>Typography</p>
                    </a>
                </li>
                <li>
                    <a href="icons.html">
                        <i class="ti-pencil-alt2"></i>
                        <p>Icons</p>
                    </a>
                </li>
                <li>
                    <a href="/photo_maps">
                        <i class="ti-map"></i>
                        <p>Maps</p>
                    </a>
                </li>

            </ul>
      </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse">

                    <!-- dashboard navbar stuff -->

                </div>
            </div>
        </nav>


        <div class="content">
          <div class="content">
                      <div class="container-fluid">
                          <div class="row">
                              <div class="col-lg-4 col-md-5">
                                  <div class="card card-user">
                                      <div class="image">
                                          <img src="assets/img/background.jpg" alt="..."/>
                                      </div>

                                      <!-- USER PROFILE -->
                                      <div class="content">
                                          <div class="author">
                                            <img class="avatar border-white" src="<%= @pet.image %>" alt="..."/>
                                            <h4 class="title"> <%= @pet.name %> <br/>
                                               <a href="#"><small><%= link_to "Edit Info", edit_pet_path(@pet) %></small></a>
                                            </h4>
                                          </div>
                                          <p class="description text-center">
                                            <%= @pet.breed %> | <%= @pet.sex %> <br>

                                          </p>
                                      </div>

                                      <hr>

                                      <div class="text-center">
                                          <div class="row">
                                              <div class="col-md-3 col-md-offset-1">
                                                  <h5>Health:</h5>
                                              </div>
                                              <div class="col-md-4">
                                                  <h5>Upcoming Appointments:<br /><small>Used</small></h5>
                                              </div>
                                              <!-- <div class="col-md-3">
                                                  <h5>24,6$<br /><small>Spent</small></h5>
                                              </div> -->
                                          </div>
                                      </div>
                                  </div>
                                  <div class="card">
                                      <div class="header">
                                          <h4 class="title">Places</h4>
                                      </div>
                                      <div class="content">
                                          <ul class="list-unstyled team-members">
                                                      <li>
                                                          <div class="row">

                                                          </div>
                                                      </li>
                                                  </ul>
                                      </div>
                                  </div>
                              </div>

                              <!-- PROFILE EDIT-->
                              <div class="col-lg-8 col-md-7">
                                  <div class="card">
                                      <div class="header">
                                          <h4 class="title">Photos</h4>
                                      </div>
                                      <div class="content">

                                  </div>
                              </div>


                          </div>
                      </div>
                  </div>
        </div> <!-- CONTENT --->

        <div class="col-md-6">
          <div class="card">
              <div class="header">
                  <h4 class="title">Photos</h4>


              </div>
              <div class="content">

          </div>
        </div>


    </div>
</div>
