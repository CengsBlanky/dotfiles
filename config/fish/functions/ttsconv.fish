function ttsconv
    set input_txt $argv[1]
    set voice $argv[2]

    if test -z "$voice"
        set voice "zh-CN-YunyangNeural"
    end
    set mp3_file (path change-extension mp3 $input_txt)
    echo "convert $input_txt to $mp3_file start..."
    edge-tts -f $input_txt -v $voice --write-media $mp3_file
end
