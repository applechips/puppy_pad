<%= link_to "Home", home_path %>
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
