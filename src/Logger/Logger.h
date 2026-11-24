#pragma once

#include <glm.hpp>
#include <string>
#include <vector>

enum class LogType
{
    LOG_DEBUG,
    LOG_WARNING,
    LOG_ERROR,
    LOG_FATAL,
};

struct LogEntry
{
    LogType type{LogType::LOG_DEBUG};
    std::string message{};

    glm::vec4 GetColor() const;
};

class Logger
{
  private:
    inline static std::vector<LogEntry> m_messages{};

  public:
    static const std::vector<LogEntry>& GetMessages();
    static void Debug(const std::string& msg);
    static void Err(const std::string& msg);
    static void Warn(const std::string& msg);
    static void Fatal(const std::string& msg);
};