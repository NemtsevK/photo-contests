# Техническое задание

1. Выполнить редизайн страницы [Галереи работ конкурса](https://xn--j1aaidmgm0e.xn--p1ai/contests/ErlNjQ/gallery).
   * Для редизайна требуется использовать макет в [Figma](https://www.figma.com/design/pQhNRCmpgtsCqJT2ouRowD).
2. Реализовать динамику на странице: названия работ (выделено красным), категории (выделено синим) и количество лайков и комментарием (вылено зеленым) должны изменяться удаленно, например, из БД.
3. Сверстанная страница должна иметь адаптивную верстку по правилам:
   * Количество блоков заявок в строке должно постепенно уменьшаться
   * Их ширина должна изменяться в зависимости от количества блоков в строке
   * При уменьшении страница последние блоки должны переходить на новую строку
   * Хэдр должен скрыть лишние элементы
