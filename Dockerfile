# Use an official Python runtime as a parent image.
FROM python:3.7-slim

# Set the working directory in the container to /app
#WORKDIR WILL CREATE A FOLDER CALLED APP AND GET INTO IT AND MAKE IT OUR WORK DIRECTORY
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

#both pws and ls can be removed from the dockerfile

# Check the present work directory in image
RUN pwd

# List out the files and folders in the current directory
RUN ls

# Install any needed packages specified in requirements.txt
#--nocache-dir mean even if the dependencies are there, still download it
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Set the FLASK_APP environment variable
ENV FLASK_APP=back-end/app.py

# Run Flask when the container launches
CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]
