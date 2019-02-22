clc
close all

mic = 1 % variabila asta controleaza daca vrei tu sa inregistrezi cu micofonul un sunet sau nu . 0 inseamna microfon , 1 inseamna sunet .wav

if mic == 1

   [voicein,Fsin] = audioread('liceeni.wav');

else
    recObj = audiorecorder
    disp('Start speaking.') 
    recordblocking(recObj, 3);
    disp('End of Recording.');
    play(recObj);

    voicein = getaudiodata(recObj);
    Fsin = 8000;

end

voice = voicein(:,1);

sound(voice,Fsin)

figure();

plot(voice);
pause(6);
[hroom,Fsh] = audioread('sample.wav');  %incarc functia pondere a camerei
sound(hroom,Fsh);


figure();
plot(hroom);

disp('The Great Hall is a multipurpose hall that can hold approximately 800 seats. The hall has a stage and seating areas on the floor and a balcony. The microphones were placed in the seating area on the floor, roughly a 23 m x 16 m area, which was cleared of chairs. The microphone positions are identical to the layout for the Octagon, 169 IRs over a 12 m x 12 m area. The room is significantly bigger than the measuring area as the balcony extends 20 m past the rear wall');
pause(4);


output = conv(hroom,voice) ;
plot(output);

sound(output,Fsin);