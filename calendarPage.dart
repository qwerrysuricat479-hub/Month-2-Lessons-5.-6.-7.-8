import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  final VoidCallback onToggleLanguage;

  CalendarPage({super.key, required this.onToggleLanguage});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final Map<DateTime, List<String>> _events = {};
  List<String> _getEventsForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _events[key] ?? [];
  }

  void _addEvent() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Новое событие'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Название события'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final key = DateTime(
                  _selectedDay.year,
                  _selectedDay.month,
                  _selectedDay.day,
                );
                setState(() {
                  _events.putIfAbsent(key, () => []);
                  _events[key]!.add(controller.text);
                });
              }
              Navigator.pop(context);
            },
            child: Text('Добавить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final events = _getEventsForDay(_selectedDay);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 226, 247),
        title: Text('Приложение Каленъдарь'),
        actions: [
          IconButton(
            onPressed: widget.onToggleLanguage,
            icon: Icon(Icons.language),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: Localizations.localeOf(context).languageCode,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2030),
            selectedDayPredicate: (day) {
              return isSameDay(day, _selectedDay);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: const Color.fromARGB(255, 104, 219, 194),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: const Color.fromARGB(255, 158, 142, 202),
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 16),

          Text(
            Localizations.localeOf(context).languageCode == 'ru'
                ? 'Выбрано: ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}'
                : 'Selected: ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
            style: TextStyle(fontSize: 14),
          ),

          SizedBox(height: 16),
          Expanded(
            child: events.isEmpty
                ? Center(
                    child: Text(
                      Localizations.localeOf(context).languageCode == 'ru'
                          ? 'Событий нет'
                          : 'No events',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (_, index) => Card(
                      child: ListTile(
                        leading: const Icon(Icons.event),
                        title: Text(events[index]),
                        onTap: () {
                          final controller = TextEditingController(
                            text: events[index],
                          );

                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Редактировать'),
                              content: TextField(controller: controller),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      events[index] = controller.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Сохранить'),
                                ),
                              ],
                            ),
                          );
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              events.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
