# Import library
from main import bot, dp
from aiogram import types
from aiogram.types import Message

keyboard_markup = types.ReplyKeyboardMarkup(row_width=3)

# Array for keyboard
array_keyboard = [1, 2]

# Send message to admin
async def send_to_admin(dp):
        await bot.send_message(chat_id=341572477, text="Bot start")
        
# Function of start bot
@dp.message_handler(commands=['start'])
async def send_welcome(message: types.Message):
        keyboard_markup.add(*(types.KeyboardButton(text) for text in array_keyboard))
        await message.answer(text='Салам', reply_markup=keyboard_markup)
        
