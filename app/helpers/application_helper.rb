module ApplicationHelper
  
  def parse_twitter str 
    str = str.dup
    
    # parse links
    str.gsub!(/[A-Za-z]+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&~\?\/.=]+/) do |m| 
      link_to(m, m)
    end
    
    # parse @mentions
    str.gsub!(/[@]+[A-Za-z0-9_]+/) do |m| 
      username = m.tr('@', '')
      link_to "http://twitter.com/#{username}"
    end
    
    # parse hashtags
    str.gsub!(/[#]+[A-Za-z0-9_]+/) do |m| 
      ht = m.tr('#', '')
      link_to m, "http://twitter.com/#{ht}"
    end
    
    str.html_safe
  end
  
  def tweet_distance_of_time(from_time, to_time = Time.now, options = {})
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time   = to_time.to_time   if to_time.respond_to?(:to_time)
  
    distance_in_minutes = (((to_time - from_time).abs)/60).round
    distance_in_seconds = ((to_time - from_time).abs).round

    case distance_in_minutes
      when 0..1
        case distance_in_seconds
          when 0..59 then "#{distance_in_seconds}s"
          else            "1m"
        end
      when 2..59    then "#{distance_in_minutes}m"
      when 60..1439 then "#{(distance_in_minutes.to_f / 60.0).round}h"
      else
        year = " %y" if from_time.year != Time.now.year
        from_time.strftime("#{from_time.day} %b#{year}")
    end
  end
  
end
