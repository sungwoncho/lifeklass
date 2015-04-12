require "rails_helper"

RSpec.describe Courses::CoursesController, type: :routing do

  routes { Courses::Engine.routes }

  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses").to route_to("courses/courses#index")
    end

    it "routes to #new" do
      expect(:get => "/courses/new").to route_to("courses/courses#new")
    end

    it "routes to #show" do
      expect(:get => "/courses/1").to route_to("courses/courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/courses/1/edit").to route_to("courses/courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/courses").to route_to("courses/courses#create")
    end

    it "routes to #update" do
      expect(:put => "/courses/1").to route_to("courses/courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/courses/1").to route_to("courses/courses#destroy", :id => "1")
    end

  end
end
