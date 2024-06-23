imaqhwinfo                                                  %ver la info
imaqhwinfo('winvideo')                                      %ver la info
imaqhwinfo('winvideo',1)                                    %ver la info
vid = videoinput('winvideo','HP Wide Vision HD Camera');    %variable para llamar a la camara
propinfo(vid)                                               %ver la info
start(vid)                                                  %iniciar la camara
preview(vid)                                                %mostrar lo que se ve la camara
img=getsnapshot(vid);                                       %tomar foto
imshow(img)                                                 %ver la foto