/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

var setPerms = function() {
 console.log("made it");
   var email = document.getElementById("emailInput").value;
   var group = document.getElementById("permInput").value;
   <% @users.each_with_index do |user, index|%>
     if(user.email == email) {
       switch(group)
         {   
           case "associate":
            <%= user.associate = true;%>
            <%= user.lead = false;%>
            <%= user.admin = false;%>
           case "lead":
            <%= user.associate = false;%>
            <%= user.lead = true;%>
            <%= user.admin = false;%>
           case "admin":
            <%= user.associate = false;%>
            <%= user.lead = false;%>
            <%= user.admin = true;%>
         }
       break;
     }
   <%end %>

