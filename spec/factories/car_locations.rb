FactoryGirl.define do
  factory :car_location do
    description "test description"
    lonlat "Point(-.297732 51.514251}"

    factory :hamilton_location do
      description "Ealing Broadway - Hamilton Rd"
      lonlat "Point(-.297732 51.514251)"
    end

    factory :angel_location do 
      description "Angel - Myddleton Sq"
      lonlat "Point(-.108989 51.529679)"
    end

    factory :subury_location do
      description "Sudbury - Williams Way"
      lonlat "Point(-.315159 51.553667)"
    end

    factory :belsize_location do
      description "Belsize Park - Belsize Sq"
      lonlat "Point(-.17217 51.547737)"
    end

    factory :spencer_location do
      description "Acton - Spencer Rd"
      lonlat "Point(-.267982 51.510092)"
    end

    factory :queen_park_location do
      description "Queen's Park - Harvist Rd"
      lonlat "Point(-.216093 51.532504)"
    end

    factory :christchurch_location do
      description "Kilburn - Christchurch Ave S" 
      lonlat "Point(-.211544 51.542523)"
    end

    factory :nottinghill_location do
      description "Notting Hill - Kensington Pk"
      lonlat "Point(-.203927 51.512932)"
    end
    
    factory :baywater_location do
      description "Bayswater - Salem Rd"
      lonlat "Point(-.188649 51.512692)"
    end

    factory :kensal_town_location do
      description "Kensal Town - Warlock Rd"
      lonlat "Point(-.201147 51.526962)"
    end

  end
end