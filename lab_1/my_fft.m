function output = my_fft(input)
    N = length(input);
    
    if N <= 1
        output = input;
    else
        even = my_fft(input(1:2:N));
        odd = my_fft(input(2:2:N));
        T = exp(-2i * pi * (0:length(odd)-1) / length(odd));
        even_extended = even + T .* odd;
        odd_extended = even - T .* odd;
        output = [even_extended, odd_extended];
    end
end
