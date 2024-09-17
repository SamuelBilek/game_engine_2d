#include "Logger.h"
#include <iostream>
#include <string>
#include <chrono>
#include <ctime>

const std::string consoleColorWhite = "\033[0m";
const std::string consoleColorGreen = "\x1B[32m";
const std::string consoleColorRed = "\x1B[91m";

std::vector<LogEntry> Logger::messages;

std::string CurrentDateTimeToString() {
	std::time_t now = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
	std::string output(30, '\0');
	std::tm localTime;
	localtime_s(&localTime, &now);
	std::strftime(&output[0], output.size(), "%d-%b-%Y %H:%M:%S", &localTime);
	return output;
}

void Logger::Log(const std::string& message) {
	LogEntry entry;
	entry.type = LogType::LOG_INFO;
	entry.message = "LOG: [" + CurrentDateTimeToString() + "]: " + message;
	std::cout << consoleColorGreen << entry.message << consoleColorWhite << std::endl;
	messages.push_back(entry);
}

void Logger::Err(const std::string& message) {
	LogEntry entry;
	entry.type = LogType::LOG_ERROR;
	entry.message = "ERR: [" + CurrentDateTimeToString() + "]: " + message;
	std::cerr << consoleColorRed << entry.message << consoleColorWhite << std::endl;
	messages.push_back(entry);
}