#pragma once

#include <string>
#include <vector>

enum class LogType
{
    LOG_INFO,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
};

struct LogEntry
{
    LogType type{LogType::LOG_INFO};
    std::string message{};
};

class Logger
{
  public:
    inline static std::vector<LogEntry> messages{};
    static void Log(const std::string& msg);
    static void Err(const std::string& msg);
    static void Warn(const std::string& msg);
    static void Fatal(const std::string& msg);
};