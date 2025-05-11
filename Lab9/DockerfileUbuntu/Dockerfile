# Ubuntu:latest that I have already installed before so docker won't have to fetch it again
# instead of Ubuntu:bionic due to internet scarcity
FROM ubuntu:latest

# fortune-min is not found
RUN apt update && apt install -y fortune

# Run this command uppon container creation
CMD [ "/usr/games/fortune" ]