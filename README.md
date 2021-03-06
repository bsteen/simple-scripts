# simple-scripts
A collection of simple but useful Bash scripts so I don't have to remember the commands. Most scripts deal with `.pdf` or video file manipulation/conversion. Some scripts have become less "simple" over time as I add more functionality, but my goal is to make the code easy to understand over making it compact or efficient.

**© 2020 - 2021 Benjamin Steenkamer. See LICENSE file for usage details.**

# List of Scripts
* `avcomb.sh`
    * Combine the audio stream of video 1 with the video stream of video 2.
    * Requires [`ffmpeg`](https://linux.die.net/man/1/ffmpeg).
* `djvu2pdf.sh`
    * Convert `.djvu` to `.pdf`.
    * Requires [`ddjvu`](https://linux.die.net/man/1/ddjvu).
* `hashmd.sh`
    * Calculates the checksum/hashes of all the files in a folder and generates a Markdown-style table of the results.
    * Requires `libarchive-zip-perl`.
    * See an example of the tables generated [here](https://bsteen.github.io/hashes.html).
* `pdf2png2pdf.sh`
    * Convert `.pdf` to `.png` and then back to `.pdf`.
    * Useful for deactivating links in the `.pdf`.
    * Requires [`convert`](https://linux.die.net/man/1/convert) from [`imagemagick`](https://linux.die.net/man/1/imagemagick).
* `pdfcombine.sh`
    * Combine multiple `.pdf` files into a single `.pdf`.
    * Requires [`pdftk`](https://linux.die.net/man/1/pdftk).
* `shredu.sh`
    * Overwrites the specified file(s) with 3 passes of random data, a final 4th pass of all zeros, and then removes the file(s).
    * Output is set to verbose to show all steps.
    * Used the [`shred`](https://linux.die.net/man/1/shred) command
* `to-webm.sh`
    * Converts a video container file (e.g. .mp4) to .webm format.
    * Requires [`ffmpeg`](https://linux.die.net/man/1/ffmpeg).
* `upgrade.sh`
    * Fetch and update packages; then remove old packages.
    * Uses `apt-get` package manager.
* `vid2avi.sh`
    * Convert a compatible video container file to `.avi` while trying to maintain good quality.
    * Requires [`ffmpeg`](https://linux.die.net/man/1/ffmpeg).
