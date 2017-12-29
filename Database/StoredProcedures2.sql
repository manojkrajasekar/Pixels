use photoapp;

/*This stored procedure is executed, when a new user is added.*/
CALL Register_user('manoj.k.rajasekar@gmail.com', 'Manoj', 'Rajasekar');
CALL Register_user('vignesh.sekar@gmail.com', 'Vignesh', 'Rajasekar');
CALL Register_user('venkat@gmail.com', 'venkat', 'vellaichamy');
CALL Register_user('Abhinav@gmail.com', 'Abhi', 'Karthikeyan');

/*This stored procedure is executed when a new topic is posted*/
CALL Add_topic('01', 'manoj.k.rajasekar@gmail.com', 'Wildlife');

/*Stored procedure is executed, which stores the post details in the database */
CALL Insert_postdetails('1', 'vignesh.sekar@gmail.com', '01', 'vignesh/tiger','Brave');
CALL Insert_postdetails('2', 'venkat@gmail.com', '01', 'venkat/lion','King');
CALL Insert_postdetails('4', 'Abhinav@gmail.com', '01', 'Abhinav/zebra','zebra');

