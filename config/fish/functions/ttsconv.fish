function ttsconv
    set -l ebook_name (realpath $argv[1])
    set -l voice $argv[2]

    echo "start convert ebook: $ebook_name"
    set -l book_basename (path basename $ebook_name)
    set -l origin_extension (path extension $ebook_name)
    set -l text_book (path change-extension "txt" $book_basename)
    set -l audio_book (path change-extension "mp3" $book_basename)

    set -l suffix_name (path change-extension "" $book_basename)
    set -l tmp_dir $HOME/tmp/ttsconv_$suffix_name
    mkdir -p $tmp_dir
    echo "create temp directory: $tmp_dir"
    cd $tmp_dir

    if test $origin_extension = ".txt"
        cp $ebook_name ./
    else
        echo (string join " " "convert" $ebook_name "to" $text_book "...")
        ebook-convert $ebook_name $text_book
    end
    sed -i '/^ *$/d' $text_book
    echo (string join " " "total lines:" (wc -l $text_book))

    set -l concatfile "files.txt"
    if test -e $concatfile
        rm $concatfile
    end
    split -l 50 -d $text_book --additional-suffix=split_text
    set -l split_files (ls -1 | grep -E "^x[0-9]+split_text\$")
    set -l split_file_count (count $split_files)
    set -l nth_count 1
    for file in $split_files
        set -l mp3_file (string join "" "tmp_" (path change-extension mp3 $file))
        if test -z "$voice"
            set voice "zh-CN-YunyangNeural"
        end
        edge-tts -f $file -v $voice --write-media $mp3_file
        while test $status -ne 0; edge-tts -f $file -v $voice --write-media $mp3_file; end
        echo "file '$mp3_file'" >> $concatfile
        echo "convert $file to $mp3_file -> "(math --scale=2 "100 * $nth_count / $split_file_count")"%"
        set nth_count (math $nth_count + 1)
    end
    ffmpeg -f concat -safe 0 -i $concatfile -c:a copy $audio_book
    if test $status -eq 0
        echo "remove temp files..."
        rm tmp_*.mp3 $split_files $text_book
        echo "audio file save to "(realpath $audio_book)
    else
        echo "ffmpeg combine failed!"
    end
end
