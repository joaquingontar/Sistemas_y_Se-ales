% Script: P2_script.m
% Author: Federico, Scheytt - Joaquin, Gonzalez Targon
% Date: Julio 2023

clear, clc, close all

%% Carga de datos
    [y, Fs] = audioread('tonos.wav');	
    % Discretizacion de tiempos
        t = (0:1/Fs:(length(y)-1)/Fs)';
    % Grafico señal
        figure(1)
            plot(t,y,'b'), hold on, grid on
                title('Señal de tonos')
                xlabel('Tiempo [seg]')
                ylabel('y(t)')
                  
%% Espectro de la señal ruidosa mediente FFT
    % Calculo de N
        L = length(y);
        N = 2^(ceil(log2(L))); % N > L
    % FFT
        Y = fft(y,N);
    % Discretizacion de tiempos
        F = (-Fs/2:Fs/N:Fs/2-Fs/N)';
    % Grafico del espectro de la señal
        figure(2)
            plot(F,abs(fftshift(Y)),'b'), hold on, grid on
                title('Espectro señal ruidosa')
                xlabel('Frecuencia [Hz]')
                ylabel('|Y(F)|')
       
%% Transformada de Fourier en tiempo corto STFT
    % Longuitud de cada frame
        L =(450e-3)*Fs;
    % DTFT para cada frame e identificacion de digito
        for k = 1:length(y)/L
            % Calculo de FFT para el frame
                Xf = fft(y(((k-1)*L)+1:k*L));
            % Frecuencias de mayor amplitud
                % 500Hz < F < 1000Hz: FL
                [v1,p1] = max(Xf(500*L/Fs:1000*L/Fs));
                % 1000Hz < F < 2000Hz: FH
                [v2,p2] = max(Xf(1000*L/Fs:2000*L/Fs));
                p2 = p2 + 1000*L/Fs;
            % Identificacion de digito
                D(k) = P2_function(p1*Fs/L, p2*Fs/L);
        end

%% Canal de transmision
    % Respuesta al impulso
        h = fir1(80,0.325);
    % Respuesta en frecuencia del canal
        H = fft(h,N);
    % Grafico del espectro de la señal
        figure(2)
            plot(F,abs(fftshift(H)),'b'), hold on, grid on
                title('Respuesta en frecuencia del canal h(n)')
                xlabel('Frecuencia [Hz]')
                ylabel('|H(n)|')
    % DTFT para cada frame e identificacion de digito por canal de transmision
        for k = 1:length(y)/L
            % Calculo de FFT para el frame
                Xf = fft(y(((k-1)*L)+1:k*L)).*H;
            % Frecuencias de mayor amplitud
                % 500Hz < F < 1000Hz: FL
                [v1,p1] = max(Xf(500*L/Fs:1000*L/Fs));
                % 1000Hz < F < 2000Hz: FH
                [v2,p2] = max(Xf(1000*L/Fs:2000*L/Fs));
                p2 = p2 + 1000*L/Fs;
            % Identificacion de digito
                D(k) = P2_function(p1*Fs/L, p2*Fs/L);
        end 
                
                