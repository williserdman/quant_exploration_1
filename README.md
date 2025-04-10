# creating my algorithmic trader

MacOS proved to be a bit of a pain to run docker, so I used colima, here's the run command
`colima start`

here's the docker run command that I used.. built the image using the provided Dockerfile
`docker run -d -p 8888:8888 -v $(pwd)/notebooks:/opt/notebooks --name jupyter-lab conda-jupyter`

then on port 8888 there is the jupyter with conda running through the docker container... remember that this is running on Apple Silicon

going to have to adapt to use `yfinance` becuase the quandl (now nasdaqdatalink) is down when I was working with it (the test folder and associated venv is for dealing with this)
