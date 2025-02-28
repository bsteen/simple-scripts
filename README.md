# simple-scripts
A collection of simple but useful Bash scripts so I don't have to remember the commands. Most scripts deal with `.pdf` or video file manipulation/conversion. Some scripts have become less "simple" over time as I add more functionality, but my goal is to make the code easy to understand over making it compact or efficient.

See [`LICENSE`](LICENSE) for details.

# PDF Scripts
* `djvu2pdf.sh`
    * Convert `.djvu` to `.pdf`
    * Requires [`ddjvu`](https://linux.die.net/man/1/ddjvu)
* `pdf2png.sh`
    * Convert `.pdf` to a set of `.png`s
* `pdf2png2pdf.sh`
    * Convert `.pdf` to `.png` and then back to `.pdf`
    * Useful for stripping hyperlinks and searchable text in PDFs
    * Requires [`imagemagick`](https://linux.die.net/man/1/imagemagick)
* `pdfcombine.sh`
    * Combine multiple `.pdf` files into a single `.pdf`
    * Requires [`pdftk`](https://linux.die.net/man/1/pdftk)
# Video Scripts
* `avcomb.sh`
    * Combine the audio stream of video 1 with the video stream of video 2
    * Requires [`ffmpeg`](https://linux.die.net/man/1/ffmpeg)
* `to-webm.sh`
    * Converts a video container file (e.g. .mp4) to .webm format
    * Requires [`ffmpeg`](https://linux.die.net/man/1/ffmpeg)
* `vid2avi.sh`
    * Convert a compatible video container file to `.avi` while trying to maintain good quality
    * Requires [`ffmpeg`](https://linux.die.net/man/1/ffmpeg)
# Other Scripts
* `2iso.sh`
   * Converts a single file or folder into a `.iso` file
   * Requires `mkisofs`
* `hashmd.sh`
    * Calculates the checksum/hashes of all the files in a folder and generates a Markdown-style table of the results.
    * Requires `libarchive-zip-perl`
    * See an example of the tables generated [here](https://bsteen.github.io/hashes.html)
* `randstr.sh`
    * Get 128 bytes of random data from `/dev/urandom` and print visible ASCII characters only
    * Passing `-a` makes only alpha-numeric characters print
    * Passing `-A` makes only alpha-numeric characters print, excluding O0lI
* `sha256-check.sh`
    * `--check` if the calculated SHA256 sum of file equals the provided SHA256 sum string
    * Saves you from making a formatted file with the sum and filename then running `sha256sum --check ...`
    * Usage: `./sha256-check.sh <file> <SHA-256-str>`
* `shredu.sh`
    * Overwrites the specified file(s) with random data, then with all zeros, and then removes the file(s)
    * **Has option to recursively shred all files in directory: `-r`**
    * Uses the [`shred`](https://linux.die.net/man/1/shred) command
* `upgrade.sh`
    * Fetch and update packages; then remove old packages
    * Uses `apt-get` package manager
