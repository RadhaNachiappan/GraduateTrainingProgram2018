submitted by radha.nachiappan

Movie ( mID, title, year, director ) 
create table Movie(mId Number Constraint pk_key PRIMARY KEY,title text,year Number(4),director text);

Reviewer ( rID, name )
create table Reviewer(rId Number Constraint pk_key PRIMARY KEY,name text);


Rating ( rID, mID, stars, ratingDate ) 
create table Rating(rId Number references  Reviewer(rId),mId Number references  Movie(mId),stars int,ratingDate Date);


1.Find the titles of all movies directed by Steven Spielberg. (1 point possible)

select title from Movie where director='Steven Spielberg';

E.T.
Raiders of the Lost Ark

return count-2


2.Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. (1 point possible)

select distinct(year),title from Movie m INNER JOIN Rating r on m.mId=r.mId  where r.stars=4 or r.stars=5 order by year;

1937|Snow White
1939|Gone with the Wind
1981|Raiders of the Lost Ark
2009|Avatar

return count-4


3.Find the titles of all movies that have no ratings. (1 point possible)

SELECT title from Movie m where m.mId not in(select m.mId from movie m inner join Rating r on m.mId=r.mId);

Star Wars
Titanic

return count-2


4.Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date.

select re.name from Reviewer re inner join Rating ra on re.rId=ra.rId where ratingdate is NULL;

Daniel Lewis
Chris Jackson

return count-2


5.Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. (1 point possible)

select m.title,re.name,ra.ratingdate,ra.stars from Movie m inner join Reviewer re inner join Rating ra on m.mId=ra.mId and re.rId=ra.rId order by re.name,m.title,ra.ratingdate,ra.stars;

E.T.|Ashley White|2011-01-02|3
Raiders of the Lost Ark|Brittany Harris|2011-01-12|4
Raiders of the Lost Ark|Brittany Harris|2011-01-30|2
The Sound of Music|Brittany Harris|2011-01-20|2
E.T.|Chris Jackson|2011-01-22|2
Raiders of the Lost Ark|Chris Jackson||4
The Sound of Music|Chris Jackson|2011-01-27|3
Snow White|Daniel Lewis||4
Avatar|Elizabeth Thomas|2011-01-15|3
Snow White|Elizabeth Thomas|2011-01-19|5
Avatar|James Cameron|2011-01-20|5
Gone with the Wind|Mike Anderson|2011-01-09|3
Gone with the Wind|Sarah Martinez|2011-01-22|2
Gone with the Wind|Sarah Martinez|2011-01-27|4

return count-14

6.For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie. (1 point possible)



7.For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. (1 point possible)

select m.title,ra.stars from movie m inner join rating ra on m.mid=ra.mid group by m.mid having max(ra.stars) order by m.title;

Avatar|5
E.T.|3
Gone with the Wind|4
Raiders of the Lost Ark|4
Snow White|5
The Sound of Music|3

return count-6

8.For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. (1 point possible)
 
select m.title,max(ra.stars)-min(ra.stars) as ratingspread from movie m inner join rating ra on m.mid=ra.mid group by m.mid order by ratingspread desc ,m.title;

Avatar|2
Gone with the Wind|2
Raiders of the Lost Ark|2
E.T.|1
Snow White|1
The Sound of Music|1

return count-6


9.Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.) (1 point possible)

10.Find the names of all reviewers who rated Gone with the Wind. (1 point possible)

select distinct(re.name) from Reviewer re inner join Rating ra inner join Movie m on re.rId=ra.rId and ra.mId=m.mId where m.title='Gone with the Wind';

Sarah Martinez
Mike Anderson

return count-2


11.For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. (1 point possible)

select re.name,m.title,ra.stars from Movie m inner join reviewer re inner join Rating ra on re.rId=ra.rId and m.mId=ra.mId where m.director=re.name;

James Cameron|Avatar|5

return count-1


12.Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) (1 point possible)

select distinct(re.name),m.title from Movie m INNER JOIN Reviewer re inner join Rating ra on re.rId=ra.rId and m.mId=ra.mId order by re.name ,m.title;

Ashley White|E.T.
Brittany Harris|Raiders of the Lost Ark
Brittany Harris|The Sound of Music
Chris Jackson|E.T.
Chris Jackson|Raiders of the Lost Ark
Chris Jackson|The Sound of Music
Daniel Lewis|Snow White
Elizabeth Thomas|Avatar
Elizabeth Thomas|Snow White
James Cameron|Avatar
Mike Anderson|Gone with the Wind
Sarah Martinez|Gone with the Wind

return count-12


13.Find the titles of all movies not reviewed by Chris Jackson. (1 point possible)

select title from movie where mId not in(select m.mId from Movie m inner join Reviewer re inner join Rating ra on re.rId=ra.rId and m.mId=ra.mId and re.name='Chris Jackson');

Gone with the Wind
Star Wars
Titanic
Snow White
Avatar

return count-5

14.For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. Eliminate duplicates, don't pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order. (1 point possible)



15.For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars. (1 point possible)
 
select re.name,m.title,ra.stars from movie m inner join reviewer re inner join rating ra on m.mid=ra.mid and re.rid=ra.rid where stars=(select min(stars) from rating);

Sarah Martinez|Gone with the Wind|2
Brittany Harris|The Sound of Music|2
Brittany Harris|Raiders of the Lost Ark|2
Chris Jackson|E.T.|2

return count-4


16.List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. (1 point possible)

select m.title,avg(ra.stars) as star from movie m inner join rating ra on m.mid=ra.mid group by m.mid order by m.title;

Avatar|4.0
E.T.|2.5
Gone with the Wind|3.0
Raiders of the Lost Ark|3.33333333333333
Snow White|4.5
The Sound of Music|2.5

return count-6


17.Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.) (1 point possible)

select re.name,re.rid,ra.stars as total from reviewer re inner join rating ra on re.rid=ra.rid where ra.stars>=3 group by re.rid ;

Sarah Martinez|201|4
Daniel Lewis|202|4
Brittany Harris|203|4
Mike Anderson|204|3
Chris Jackson|205|4
Elizabeth Thomas|206|5
James Cameron|207|5
Ashley White|208|3

return count-8


18.Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. (As an extra challenge, try writing the query both with and without COUNT.) (1 point possible)


19.Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.) (1 point possible)

select max(t1.star),t1.title,MID from(select avg(ra.stars) as star,m.title as title,m.mid as MID from movie m inner join rating ra on m.mid=ra.mid group by m.mid) as t1;

4.5|Snow White|106

return count-1


20.Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.) (1 point possible)

select mIN(t1.star),t1.title,MID from(select avg(ra.stars) as star,m.title as title,m.mid as MID from movie m inner join rating ra on m.mid=ra.mid group by m.mid) as t1;

2.5|The Sound of Music|103

return count-1


21.For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL. (1 point possible)

SELECT m.mid,re.rid,m.director,m.title,max(ra.stars) from movie m inner join rating ra inner join reviewer re on m.mid=ra.mid and ra.rid=re.rid where m.director is not null group by m.mid ;

101|201|Victor Fleming|Gone with the Wind|4
103|205|Robert Wise|The Sound of Music|3
104|208|Steven Spielberg|E.T.|3
107|207|James Cameron|Avatar|5
108|203|Steven Spielberg|Raiders of the Lost Ark|4

return count-5
