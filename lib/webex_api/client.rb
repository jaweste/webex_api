require 'webex_api/webex_error'
require 'webex_api/request'
require 'webex_api/meeting_request'
require 'webex_api/meeting'

module WebexApi
  class Client 
    attr_accessor :webex_id,:webex_password,:site_id,:site_name,:partner_id,:webex_email
    def initialize(webex_id,webex_password,site_id,site_name,partner_id=nil,webex_email=nil)
      @webex_id = webex_id
      @webex_password = webex_password
      @site_id = site_id
      @site_name = site_name
      @partner_id = partner_id
      @webex_email = webex_email
    
    end
    
    def create_meeting(name,options={})
      meeting = WebexApi::Meeting.create_meeting(self,name,options)
    end

    def get_meeting(meeting_key)
      meeting = WebexApi::Meeting.new(meeting_key,self)
      meeting.get_meeting
      meeting
    end
    
    def get_meeting_host_url(meeting_key,user_email=nil)
      meeting = WebexApi::Meeting.new(meeting_key,self)
      meeting.get_host_url(user_email)
      
    end

    def get_meeting_join_url(meeting_key,user_email=nil)
      meeting = WebexApi::Meeting.new(meeting_key,self)
      meeting.get_join_url(user_email)
      
    end

    def delete_meeting(meeting_key)
      meeting = WebexApi::Meeting.new(meeting_key,self)
      meeting.delete_meeting
    end
    # option {:name=>"ss",:address_type=>"PERSONAL or GLOBAL",:role=>"ATTENDEE or PRESENTER or HOST"}
    def add_attendee_to_meeting(meeting_key,user_email,options={})
      meeting = WebexApi::Meeting.new(meeting_key,self)
      meeting.add_attendee(user_email,options)
    end

    def delete_attendee_from_meeting(meeting_key,user_email)
      meeting = WebexApi::Meeting.new(meeting_key,self)
      meeting.delete_attendee(user_email)
    end
    def list_attendee_for_meeting(meeting_key)
      meeting = WebexApi::Meeting.new(meeting_key,self)
      meeting.list_attendees
    end
   
  end
end