%%
%Establish connection between Arduino and Matlab (real time)
%%
uno = serial('COM6', 'BaudRate', 57600); 
fopen(uno);
terminate = false;
readData = [];
error = [];
figure(1);
while (~terminate)
    readData = [readData str2num(fscanf(uno))]; 
    subplot(2,1,1);
    plot(readData, '.-');
    if (length(readData > 2))
        subplot(2,1,2);
        mdl = fitlm(1:length(readData), readData);
        error = [error mdl.Rsquared.Adjusted]; %obtain error
        plot(error, '.-r');
    end
    linkdata on;
    %%
    %Create some sort of loop termination
end
fclose(uno);
delete(uno);