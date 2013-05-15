require 'spec_helper'

describe Provider do

  let!(:user){ FactoryGirl.create(:user) }

  let!(:oauth_info) { { 
                      :provider => "google_oauth2",
                      :uid => "123456789",
                      :info => {
                          :name => "John Doe",
                          :email => "john@company_name.com",
                          :first_name => "John",
                          :last_name => "Doe",
                          :image => "https://lh3.googleusercontent.com/url/photo.jpg"
                      },
                      :credentials => {
                          :token => "token",
                          :refresh_token => "another_token",
                          :expires_at => 1354920555,
                          :expires => true
                      },
                      :extra => {
                          :raw_info => {
                              :id => "123456789",
                              :email => "user@domain.example.com",
                              :verified_email => true,
                              :name => "John Doe",
                              :given_name => "John",
                              :family_name => "Doe",
                              :link => "https://plus.google.com/123456789",
                              :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
                              :gender => "male",
                              :birthday => "0000-06-25",
                              :locale => "en",
                              :hd => "company_name.com"
                          }
                      }


    }}

  context "when correct paramaters are given" do 

    it "creates a new provider object" do 
      Provider.create(user: user, name: oauth_info[:info][:name], uid: oauth_info[:uid], token: oauth_info[:credentials][:token])
      expect(Provider.count).to eq 1
    end

    it "links that provider to its user" do 
    end
  end
end
