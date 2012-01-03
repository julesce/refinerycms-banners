# Refinery CMS Banners

Simple banners engine for [Refinery CMS](http://refinerycms.com). Creates a many-to-many relationship between Pages and Banners, allowing an Image to be assigned to a Banner as well.

This version of `refinerycms-banners` supports Rails 3.0.x.

## Requirements

Refinery CMS version 1.0.0 or above.

## Install

Open up your ``Gemfile`` and add the following:

    gem 'refinerycms-banners', '1.0', :git => 'git://github.com/julesce/refinerycms-banners.git'

Now, run:

    bundle install

Next, run:

    rails generate refinerycms_banners

Finally migrate your database and you're done.

    rake db:migrate

## Usage

It is up to you to make use of the banners assigned to your pages. To get the published banners for your current page:

    @page.banners.published

Let's say you are using the [Nivo Slider](http://nivo.dev7studios.com/) for your banners in your views, you could do the following:

    <div id="nivo_slider">
      <% if @page.present? and @page.banners.published.present? %>
        <% @page.banners.published.each do |banner| %>
          <%= image_fu(banner.image, '960x310#c') %>
        <% end %>
      <% end %>
    </div>
