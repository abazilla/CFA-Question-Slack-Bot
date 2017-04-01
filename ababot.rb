require 'slack-ruby-bot'

# TODO
# make array DONE
# On user says "question" anywhere DONE
#adds that user to the end of the array DONE
# When that question is attended to DONE
# Teacher tells user to remove themself from Bot DONE
# Bot removes the first instance of that user DONE
#Only have 1 instance of each personDONE
#Remove self from groupDONE
# Add help DONE
# add a timer
#command to show list
#make an env file and add it to the git ignore


class QuestionBot < SlackRubyBot::Bot
  question_array = []

  #Type !question and you will be added to the queue
  match /!question/ do |client, data|
    if question_array.include?("<@#{data['user']}>") == false
      question_array.push("<@#{data['user']}>")
      client.say(channel: data.channel, text: "You have been added to the question list!")
      if question_array.length == 0
        client.say(channel: data.channel, text: "No questions! Happy Teachers :)")
      else
        client.say(channel: data.channel, text: "The order is now #{question_array*", "}.")
      end
    else
      client.say(channel: data.channel, text: "You're already in the list! Be patient :)")
    end
  end

  #Type !list and shows current list
  match /!list/ do |client, data|
    if question_array.length == 0
      client.say(channel: data.channel, text: "No questions! Happy Teachers :)")
    else
      client.say(channel: data.channel, text: "The current order is #{question_array*", "}.")
    end
  end

  #Type !help to show list of commands and more
  match /!help/ do |client, data|
    client.say(channel: data.channel, text: "I'm the *question bot*! I help the teachers remember who needs help.\n\n _*Commands:*_ \n*!question* - Adds you to the question queue, and lets you know where you are in the queue.\n *!answered* - Removes you from the question queue, and lets you know who is next.\n *!list* - Lists the current queue. \n\n Made by *aba* using slack-ruby-bot - https://github.com/abazilla")
  end

  #Type !answered and you will be removed from the queue
  match /!answered/ do |client, data|
    if question_array.include?("<@#{data['user']}>")
      question_array.delete("<@#{data['user']}>")
      client.say(channel: data.channel, text: "Your question has been answered!")
      if question_array.length == 0
        client.say(channel: data.channel, text: "No questions! Happy Teachers :)")
      else
        client.say(channel: data.channel, text: "The order is now #{question_array*", "}.")
      end
    else
      client.say(channel: data.channel, text: "You're not in the list!")
    end
  end

end

# class QuestionBot < SlackRubyBot::Bot
#    help do
#     title 'Question Bot'
#     desc 'This bot stores questions in an array'
#   end
# end

QuestionBot.run
