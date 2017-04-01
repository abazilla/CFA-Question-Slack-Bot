# aba's Question Bot
A simple Slack bot wrriten in Ruby designed for Slack Channels created for classrooms. The idea is that when multiple students have a question, they can add themselves to a queue. When the teacher/s attend to their work, the student will then remove themselves from the queue, and the teacher can move on to the next student in queue.

## Usage
#### Requirements
API Key

#### Commands
**!question** - Adds the user to the question queue
**!answered** - Removes the user from the question queue
**!list** - Lists the current queue
**!help** - Lists the commands and more info

![Imgur](http://i.imgur.com/EYwEWaG.png)

## Other
This Slack bot was created by aba during the Coder Factory Academy Fast Track course. The [slack-ruby-bot](https://github.com/slack-ruby/slack-ruby-bot) framework by dblock was used to create this.
