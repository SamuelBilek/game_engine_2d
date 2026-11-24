#include "Logger.h"
#include <chrono>
#include <ctime>
#include <iostream>

glm::vec4 LogEntry::GetColor() const
{
    switch (type)
    {
    case LogType::LOG_DEBUG:
        return glm::vec4(0, 255, 0, 255);
    case LogType::LOG_WARNING:
        return glm::vec4(255, 255, 0, 255);
    case LogType::LOG_ERROR:
        return glm::vec4(255, 0, 0, 255);
    case LogType::LOG_FATAL:
        return glm::vec4(255, 0, 255, 255);

    default:
        return glm::vec4(255, 255, 255, 255);
    }
}

const std::vector<LogEntry>& Logger::GetMessages()
{
    return m_messages;
}

static constexpr const char* GREEN{"\x1B[32m"};
static constexpr const char* RED{"\x1B[91m"};
static constexpr const char* ORANGE{"\033[38;5;208m"};
static constexpr const char* MAGENTA{"\x1B[35m"};
static constexpr const char* NO_COLOR{"\033[0m"};

static std::string CurrentDateTimeToString()
{
    std::time_t now{std::chrono::system_clock::to_time_t(std::chrono::system_clock::now())};

    char buffer[30]{};

    std::strftime(buffer, sizeof(buffer), "%d/%b/%Y %H:%M:%S", std::localtime(&now));

    return buffer;
}

void Logger::Debug(const std::string& msg)
{

    std::string output = "DEBUG: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_DEBUG, output};
    m_messages.push_back(logEntry);
#ifdef DEBUG
    std::cout << GREEN << output << NO_COLOR << std::endl;
#endif
}

void Logger::Err(const std::string& msg)
{
    std::string output = "ERR: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_ERROR, output};
    m_messages.push_back(logEntry);
    std::cerr << RED << output << NO_COLOR << std::endl;
}

void Logger::Warn(const std::string& msg)
{
    std::string output = "WARN: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_WARNING, output};
    m_messages.push_back(logEntry);
    std::cout << ORANGE << output << NO_COLOR << std::endl;
}

void Logger::Fatal(const std::string& msg)
{
    std::string output = "FATAL: [" + CurrentDateTimeToString() + "]: " + msg;
    LogEntry logEntry{LogType::LOG_FATAL, output};
    m_messages.push_back(logEntry);
    std::cout << MAGENTA << output << NO_COLOR << std::endl;
}