fs = require 'fs'
path = require 'path'

handler = exports.Command = (command, tail, message) ->
    switch command
        when '~mp3'
            songs = []
            for file in fs.readdirSync './music' then if path.extname(file) is '.mp3' then songs.push(file.replace('.mp3', ''))
            return Meowbot.Discord.reply message, "the available s-songs that N-N-Nexerq-k-k-k-kun put in his f-folder are: #{songs.join ', '}"

        when '~playmp3'
            return Meowbot.Discord.reply message, 'you baka baka, I\'m not currently in a voice channel q.q' if not Meowbot.Discord.voiceConnection
            songs = fs.readdirSync './music'
            return Meowbot.Discord.reply message, 'I don\'t currently have that song, but if you... ano... k-kindly a-ask N-N-Nexerq-k-k-k-kun he might just give you a hand.' if tail + '.mp3' not in songs
            Meowbot.Discord.voiceConnection.stopPlaying()
            Meowbot.Discord.voiceConnection.playFile './music/' + tail + '.mp3'
            return Meowbot.Discord.reply message, "now playing #{tail} on your request :)"