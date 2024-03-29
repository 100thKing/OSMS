warning('OFF', 'all');

%{
1) Необходимо сгенерировать и визуализровать (вывести на график)
непрерывный сигнал, в соответствии с вариантом (таблица 1). Номер варианта
– порядковый номер в журнале группы. (Вариант 10)
%}

t = 0:0.001:1;
fc = 16;
F = 7*cos(2*pi*fc*t + pi/13);
figure(1);
subplot(1, 2, 1);
plot(1000*t, F);
xlabel("Время [мс]")
title("Сигнал F = 7*cos(2*pi*fc*t + pi/13), fc = 5 [Гц]");

%{
2) Определить максимальную частоту в спектре данного сигнала.

~fmax = 15 [Гц]
%}

fs = 30;            % Частота дискретизации                
T = 1/fs;             % Период отсчёта
t = 0:T:1;
F = 7*cos(2*pi*fc*t + pi/13);
N = length(F);
f = linspace(0, fs/2, N/2+1);
%Y = fft(F);
Y = my_fft(F);
P = abs(Y(1:N/2+1));
subplot(1, 2, 2);
stem(f,P) 
title("Спектр сигнала")
xlabel("Частота [Гц]")

%{
3) Определить минимальную необходимую частоту дискретизации
полученного сигнала (теорема Котельникова).
%}

%fs = 30 [Гц]

%{
4) Оцифровать сигнал с полученной частотой дискретизации, выбрав
требуемое число отсчетов сигнала на длительности 1 секунда, сохранить
полученные значения в массив, пока не озадачиваясь разрядностью АЦП,
просто выбранные с частотой дискретизации значения с теми уровнями,
которые имеет функция в полученных точках.
%}

fs = 30;            % Частота дискретизации                   
T = 1/fs;             % Длительность отсчёта    
t = 0:T:1; % Временные отсчёты
F = 7*cos(2*pi*fc*t + pi/13);
F_quantized = round(F);
mem = length(F_quantized) * 32; % Переменная типа int занимает в памяти 32 бита
str = sprintf('Оцифрованный сигнал займёт в памяти %d бит(-а)', mem);
figure(2)
subplot(1, 2, 1)
stairs(1000*t, F_quantized);
title(str)
ylabel("Квантованные значения")
xlabel("Время [мс]")

%{
5) Выполнить прямое дискретное преобразование Фурье для массива
временных отсчетов сигнала и оценить ширину данного спектра. А также
объем памяти, требуемый для хранения данного массива (тип переменных в
массиве – на ваше усмотрение, float, int и пр.).
%}

N = length(F_quantized);
f = linspace(0, fs/2, N/2+1);
Y = my_fft(F_quantized);
P = abs(Y(1:N/2+1));
subplot(1, 2, 2);
stem(f,P) 
title("Спектр оцифрованного сигнала")
xlabel("Частота [Гц]")


%Оцифрованный сигнал займёт в памяти 992 бита

%{
6) Восстановите оригинальный аналоговый сигнал по массиву
имеющихся у вас отсчетов, соединив их непрерывной линией и оцените
визуальное сходство оригинального сигнала и восстановленного после
оцифровки.
%}

t = 0:0.001:1;
t2 = 0:T:1;
F = 7*cos(2*pi*fc*t + pi/13);
figure(3);
subplot(1, 2, 1);
plot(1000*t2, F_quantized);
title("Восстановленный сигнал по массиву отсчётов");
xlabel("Время [мс]")
subplot(1, 2, 2);
plot(1000*t, F);
title("Оригинальный аналоговый сигнал");
xlabel("Время [мс]")

%{
7) Увеличьте частоту дискретизации в 4 раза и проделайте задания из
п.4-6. 
%}

%{
4.1) Оцифровать сигнал с полученной частотой дискретизации, выбрав
требуемое число отсчетов сигнала на длительности 1 секунда, сохранить
полученные значения в массив, пока не озадачиваясь разрядностью АЦП,
просто выбранные с частотой дискретизации значения с теми уровнями,
которые имеет функция в полученных точках.
%}

fs = 120;            % Частота дискретизации                   
T = 1/fs;             % Длительность отсчёта    
t = 0:T:1; % Временные отсчёты
F = 7*cos(2*pi*fc*t + pi/13);
F_quantized = round(F);
mem = length(F_quantized) * 32; % Переменная типа int занимает в памяти 32 бита
str = sprintf('Оцифрованный сигнал займёт в памяти %d бит(-а)', mem);
figure(4)
subplot(1, 2, 1)
stairs(1000*t, F_quantized);
title(str)
ylabel("Квантованные значения")
xlabel("Время [мс]")

%{
5.1) Выполнить прямое дискретное преобразование Фурье для массива
временных отсчетов сигнала и оценить ширину данного спектра. А также
объем памяти, требуемый для хранения данного массива (тип переменных в
массиве – на ваше усмотрение, float, int и пр.).
%}

N = length(F_quantized);
f = linspace(0, fs/2, N/2+1);
Y = my_fft(F_quantized);
%Y = fft(F_quantized);
P = abs(Y(1:N/2+1));
subplot(1, 2, 2);
stem(f,P) 
title("Спектр оцифрованного сигнала")
xlabel("Частота [Гц]")

%{
6.1) Восстановите оригинальный аналоговый сигнал по массиву
имеющихся у вас отсчетов, соединив их непрерывной линией и оцените
визуальное сходство оригинального сигнала и восстановленного после
оцифровки.
%}

t = 0:0.001:1;
t2 = 0:T:1;
F = 7*cos(2*pi*fc*t + pi/13);
figure(5);
subplot(1, 2, 1);
plot(1000*t2, F_quantized);
title("Восстановленный сигнал по массиву отсчётов");
xlabel("Время [мс]")
subplot(1, 2, 2);
plot(1000*t, F);
title("Оригинальный аналоговый сигнал");
xlabel("Время [мс]")


%{
8) Запишите аудиофайл со своим голосом (например, в формате wav).
Проанализируйте визуально спектр голоса, используя, например, приложение
Audacity (вкладки Анализ -> График спектра). Определите максимальную
частоту в спектре данного сигнала и выберите требуемую для оцифровки
частоту дискретизации.
%}
[y, Fs] = audioread('Music.wav');

Y = fft(y);

% Вычисление частотного диапазона
N = length(Y);
f = (0:N-1)*(Fs/N);

% Нахождение максимальной амплитуды и соответствующей частоты
[amp, idx] = max(abs(Y));
f_max = f(idx);

fprintf('8)\n');
% Вывод результатов
fprintf('Максимальная частота: %f Гц\n', f_max);
fprintf('Частота дискретизации: %d Гц\n', Fs);

%{
9) Используя библиотеки работы со звуком Matlab (или Pyton)
проанализируйте имеющуюся у вас запись голоса. Считайте аудиофайл с
помощью функции Matlab (файл с голосом должен лежать в рабочей
директории Matlab): 
%}





%{
10) Определите частоту дискретизации, которая была использована
при записи голоса на цифровой носитель. Для этого возьмите количество
элементов в файле с записью и разделите на длительность записи в секундах.
Например, если у вас файл состоит из 441 000 элементов (отсчетов) и имеет
длительность 10 секунд, то частота дискретизации Fs будет равна 441 000/10 =
44 100 Гц. Сравните вычисленное значение с тем, что выводится в Matlab для
Fs.
%}
fprintf('10)\n');
fprintf('Fs по matlab = %d\n',Fs);
info = audioinfo('Music.wav');
audioLength = info.Duration;
%format longG
%disp(audioLength);
fprintf('Fs расчетами = %d\n',(numel(y)/audioLength/2));


%{
11) Проредите полученный массив y с помощью функции downsample
(иными словами – уменьшите частоту дискретизации) и воспроизведите
полученный сигнал с помощью matlab-функции play() или ее аналогами в
других языках программирования. Обратите внимание на качество звучания
при неверно взятой частоте дискретизации
%}

y1 = downsample(y,10);
zvuk = audioplayer(y1,Fs/10);
play(zvuk);
stop(zvuk);


%{
12) Выполните прямое дискретное преобразование Фурье для
оригинального звучания и для прореженного сигнала, выведите на график
амплитудный спектр сигнала, определите его ширину
%}
% Оригинальное звучание
y_original = y;
Fs_original = Fs;
Y_original = fft(y_original);
L_original = length(y_original);
P2_original = abs(Y_original/L_original);
P1_original = P2_original(1:L_original/2+1);
P1_original(2:end-1) = 2*P1_original(2:end-1);
f_original = Fs_original*(0:(L_original/2))/L_original;

% Прореженный сигнал
y_downsampled = y1;
Fs_downsampled = Fs/10;
Y_downsampled = fft(y_downsampled);
L_downsampled = length(y_downsampled);
P2_downsampled = abs(Y_downsampled/L_downsampled);
P1_downsampled = P2_downsampled(1:L_downsampled/2+1);
P1_downsampled(2:end-1) = 2*P1_downsampled(2:end-1);
f_downsampled = Fs_downsampled*(0:(L_downsampled/2))/L_downsampled;


figure(8);
% Вывод амплитудного спектра
subplot(2,1,1);
plot(f_original, P1_original);
title('Амплитудный спектр оригинального звучания');
xlabel('Частота (Гц)');
ylabel('Амплитуда');

subplot(2,1,2);
plot(f_downsampled, P1_downsampled);
title('Амплитудный спектр прореженного сигнала');
xlabel('Частота (Гц)');
ylabel('Амплитуда');
%{
13) Оцените влияние разрядности АЦП на спектр сигнала. Для этого
нужно написать функцию, которая бы округляла значения отсчетов сигнала,
заданного в вашем варианте, до какого-то числа, определяемого разрядностью
АЦП. Допустим если у АЦП всего 3 разряда, то диапазон возможных
дискретных значений амплитуд временных отсчетов сигнала – это 0..7 (то есть,
7=2^3 -1). Все значения больше 7 округляются до 7. Для результирующего
дискретного сигнала требуется выполнить прямое преобразование Фурье.
Сравнить полученный спектр со спектром исходной синусоиды, отсчеты
которой не подвергались квантованию по уровню. Вывести среднюю ошибку
квантования для случаев, когда разрядность АЦП равна 3/4/5/6. 
%}

% В квантованном сигнале значения не поднимаются выше +3 и ниже -1, поэтому
% решено использовать одноразрядный АЦП, поскольку разрядности выше не
% изменят значения массива

ADC_bits = 1;
max_value = 2^ADC_bits - 1;
min_value = max_value * (-1);
new_quantized_F = F_quantized;
for i = 1:length(new_quantized_F)
    if new_quantized_F(i) > max_value || new_quantized_F(i) < min_value
        if new_quantized_F(i) > 0
            new_quantized_F(i) = max_value;
        else
            new_quantized_F(i) = min_value;
        end
    end
end

N = length(new_quantized_F);
f = linspace(0, fs/2, N/2+1);
%Y = fft(new_quantized_F);
Y = my_fft(new_quantized_F);
P = abs(Y(1:N/2+1));
figure(6);
subplot(1, 2, 1);
stem(f,P) 
title("Спектр оцифрованного сигнала с АЦП разрядностью 1");
xlabel("Частота [Гц]")

t = 0:T:1;
F = 7*cos(2*pi*fc*t + pi/13);
N = length(F);
f = linspace(0, fs/2, N/2+1);
Y = my_fft(F);
%Y = fft(F);
P = abs(Y(1:N/2+1));
subplot(1, 2, 2);
stem(f,P) 
title("Спектр сигнала")
xlabel("Частота [Гц]")
