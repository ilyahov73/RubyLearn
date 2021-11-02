def tail_rec_factorial(num, factorial_result = 1)
    if (num == 0)
        return factorial_result;
    end
    return tail_rec_factorial(num - 1, factorial_result * num);

end

puts tail_rec_factorial(5)