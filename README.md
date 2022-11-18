# Photo Organizer

**Here is the user story:**

Ursula loves to visit cities around the world and takes pictures everywhere she goes. Over time the Photos folder on her computer has gotten a little disorganized, and she needs your help!

Your primary method will take a String input containing rows of data separated by a newline character.
Each row contains the file name, the city in which it was taken, and the date and time of the photo. Use the test data below as a guide:

**Test data:**

DSC012333.jpg, Madrid, 2016-10-01 13:02:34<br>
DSC044322.jpg, Milan, 2015-03-05 10:11:22<br>
DSC130033.raw, Rio, 2018-06-02 17:01:30<br>
DSC044322.jpeg, Milan, 2015-03-04 14:55:01<br>
DSC130033.jpg, Rio, 2018-06-02 17:05:10<br>
DSC012335.jpg, Milan, 2015-03-05 10:11:24

**Your method should:**

   - Group the photos by city
   - Order the photos in each city group by date/time taken
   - Create a sequence number for each photo based on its chronological order in the city group
   - Generate a new name for the photo in the format [City][Sequence].[Extension]
       - The Extension should be the extension specified in the input string for that file
       - The Sequence should be left-padded with zeros based on the number of digits of the highest sequence number in the group (i.e., if the highest number in the Madrid group is 120, the photo with sequence 1 should be Madrid001)
   - Return the generated names of the photos as a newline-delimited string in the same order in which their rows appear in the input string

**Sample output of above data:**

Madrid1.jpg<br>
Milan2.jpg<br>
Rio1.raw<br>
Milan1.jpeg<br>
Rio2.jpg<br>
Milan3.jpg