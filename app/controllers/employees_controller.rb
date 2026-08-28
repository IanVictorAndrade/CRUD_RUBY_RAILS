class EmployeesController < ApplicationController

  def index
    # Plain Text, Signed, Encrypted

    cookies[:emp_name] = "Hey! I am a Plain Text Cookie"

    cookies[:exp_cookies] = { value: "Anthony Joshua", expires: Time.now + 2.minutes }

    cookies.signed[:user_id] = "Hey! i can be decoded, but cant be modified as I am cryptographically signed"

    cookies.encrypted[:credit_card] = 'Hey! I cant be decoded nor can be modified as I am authenticated at the time of decryption'

  end

  def home

  end

end
