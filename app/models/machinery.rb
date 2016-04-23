class Machinery
  include Mongoid::Document
  include Mongoid::Paperclip
  field :type, type: String
  field :name, type: String
  field :phone, type: String
  field :price, type: Integer
  field :min_order, type: Integer
  field :description, type: String

  belongs_to :user

  validates :type, inclusion: { in: ['Автобетоносмеситель', 'Самогруз', 'Автогрейдер', 'Автокран', 'Автоцистерна', 'Илосос',
                                     'Цементовоз', 'Бульдозер', 'Коммунальная техника', 'Мусоровоз', 'Минипогрузчик',
                                     'Миниэкскаватор', 'Погрузчик', 'Самосвал', 'Снегоуборочная техника', 'Фронтальный погрузчик',
                                     'Экскаватор', 'Другое (Укажите в описании)'], :message => 'Неверный тип транспорта' }

  has_mongoid_attached_file :avatar,
                            default_url: '/default_avatar.jpg',
                            styles: {default: '150x150#'},
                            convert_options: { :all => '-background white -flatten +matte' }
  validates_attachment_content_type :avatar, :content_type => /\Aimage/

end
