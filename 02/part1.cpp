#include <iostream>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

std::vector<std::string> splitString(std::string str, char splitter){
    std::vector<std::string> result;
    std::string current = ""; 
    for(int i = 0; i < str.size(); i++){
        if(str[i] == splitter){
            if(current != ""){
                result.push_back(current);
                current = "";
            } 
            continue;
        }
        current += str[i];
    }
    if(current.size() != 0)
        result.push_back(current);
    return result;
}

std::string first_numberstring(std::string const & str) {
      char const* digits = "0123456789";
      std::size_t const n = str.find_first_of(digits);
      if (n != std::string::npos)
      {
        std::size_t const m = str.find_first_not_of(digits, n);
        return str.substr(n, m != std::string::npos ? m-n : m);
      }
      return std::string();
    }

int main() {
    int sum = 0;

    fstream new_file;

    new_file.open("./input.txt", ios::in);

    int red_limit = 12;
    int blue_limit = 14;
    int green_limit = 13;

    if (new_file.is_open()) {
        string line;

        while (getline(new_file, line)) {
            std::vector<std::string> parts = splitString(line, ':');
            string subsetsString = parts[1];
            vector<string> subsets = splitString(subsetsString, ';');

            bool ok = true;

            for (auto subset: subsets) {
                vector<string> balls = splitString(subset, ',');

                int red = 0;
                int blue = 0;
                int green = 0;

                for (auto ball: balls) {
                    string numString = first_numberstring(ball);
                    int num = stoi(numString);

                    if (ball.find("red") != std::string::npos) {
                        red = num; 
                    } else if (ball.find("blue") != std::string::npos) {
                        blue = num;
                    } else if (ball.find("green") != std::string::npos) {
                        green = num;
                    }
                }

                if (red <= red_limit && blue <= blue_limit && green <= green_limit) {
                    //std::cout << parts[0]; 
                } else {
                    //std::cout << subset << " " << line << "\n";
                    std::cout << subset << " " << (red <= red_limit) << " " << (blue <= blue_limit) << " " << green << " " << "\n";
                    ok = false;
                }
            }

            if (ok) {
                string numString = first_numberstring(parts[0]);
                int num = stoi(numString);
//std:cout << num << "\n";
                sum += num;
            }


            // separate into game and subsets
            // seperate subsets into each
            // get number of red blue green
            // see which is above limit
        }

    } else {
    }

    new_file.close();

    std::cout << sum;
    return 0;
}

