#include "Logger.h"
#include <chrono>
#include <ctime>
#include <iostream>

static constexpr const char* GREEN{"\x1B[32m"};
static constexpr const char* RED{"\x1B[91m"};
static constexpr const char* ORANGE{"\033[38;5;208m"};
static constexpr const char* MAGENTA{"\x1B[35m"};
static constexpr const char* NO_COLOR{"\033[0m"};

static std::string CurrentDateTimeToString()
{
    std::time_t now{std::chrono::system_clock::to_time_t(std::chrono::system_clock::now())};
    std::string output(30, '\0');
    std::strftime(&output[0], output.size(), "%d/%b/%Y %H:%M:%S", std::localtime(&now));
    return output;
}

void Logger::Log(const std::string& msg)
{
    std::string output = "LOG: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_INFO, output};
    messages.push_back(logEntry);
    std::cout << GREEN << output << NO_COLOR << std::endl;
}

void Logger::Err(const std::string& msg)
{
    std::string output = "ERR: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_ERROR, output};
    messages.push_back(logEntry);
    std::cerr << RED << output << NO_COLOR << std::endl;
}

void Logger::Warn(const std::string& msg)
{
    std::string output = "WARN: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_WARNING, output};
    messages.push_back(logEntry);
    std::cout << ORANGE << output << NO_COLOR << std::endl;
}

void Logger::Fatal(const std::string& msg)
{
    std::string output = "FATAL: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_FATAL, output};
    messages.push_back(logEntry);
    std::cout << MAGENTA << output << NO_COLOR << std::endl;
}