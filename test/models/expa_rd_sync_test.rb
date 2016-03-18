require 'minitest/autorun'

class ExpaRdSyncTest < Minitest::Test
  def setup
    if EXPA.client.nil?
      xp = EXPA.setup()
      xp.auth(ENV['ROBOZINHO_EMAIL'],ENV['ROBOZINHO_PASSWORD'])
    end
    teardown
  end

  def teardown
    ExpaPerson.all.each do |person|
      person.destroy
    end
    ExpaApplication.all.each do |application|
      application.destroy
    end
    ExpaOffice.all.each do |office|
      office.destroy
    end
  end

  def test_update_podio
    office = ExpaOffice.new
    office.xp_name = 'BRASILIA'
    office.save

    person = ExpaPerson.new
    person.xp_full_name = 'teste'
    person.xp_status = 'open'
    person.xp_created_at = Time.now
    person.xp_id = 123456
    person.xp_email = 'teste@teste.com'
    person.xp_phone = '+55111234567'
    person.xp_location = 'Teste, Brasilândia :)'
    person.xp_home_lc = office
    person.interested_program = 'global_talents'
    person.interested_sub_product = 5
    person.entity_exchange_lc = office
    person.save

    xp_sync = ExpaRdSync.new
    xp_sync.update_podio
  end

  def test_insert_new_register_at_db
    assert(ExpaPerson.all.count == 0, 'DB have registers. Make sure to clean DB before run tests, and it has ' + ExpaPerson.all.count.to_s)

    params = {'per_page' => 1}
    person = EXPA::Peoples.list_by_param(params)[0]
    xp_sync = ExpaRdSync.new
    xp_sync.update_db_peoples(person)

    assert(ExpaPerson.all.count == 1, 'DB should have only 1 register, but it has ' + ExpaPerson.all.count.to_s)
  end

  def test_update_people_that_are_already_on_db
    assert(ExpaPerson.all.count == 0, 'DB have registers. Make sure to clean DB before run tests, and it has ' + ExpaPerson.all.count.to_s)

    params = {'per_page' => 2}
    people = EXPA::Peoples.list_by_param(params)
    person = people[0]
    another_person = people[1]

    xp_sync = ExpaRdSync.new
    xp_sync.update_db_peoples(person)
    assert(ExpaPerson.all.count == 1, 'DB should have only 1 register, but it has ' + ExpaPerson.all.count.to_s)

    xp_sync.update_db_peoples(person)
    assert(ExpaPerson.all.count == 1, 'DB should have only 1 register, but it has ' + ExpaPerson.all.count.to_s)

    same_person = person.clone
    same_person.full_name = person.full_name + ' test'

    xp_sync.update_db_peoples(person)
    assert(ExpaPerson.all.count == 1, 'DB should have only 1 register, but it has ' + ExpaPerson.all.count.to_s)
    xp_sync.update_db_peoples(same_person)
    assert(ExpaPerson.all.count == 1, 'DB should have only 1 register, but it has ' + ExpaPerson.all.count.to_s)
    assert(ExpaPerson.first.xp_full_name = same_person.full_name, "DB didn' updated the register. Name should be " + same_person.full_name + " but it is " + ExpaPerson.first.xp_full_name)


    xp_sync.update_db_peoples(another_person)
    assert(ExpaPerson.all.count == 1, 'DB should have only 2 registers, but it has ' + ExpaPerson.all.count.to_s)
  end

  def test_insert_every_application_from_person_at_db
    assert(ExpaPerson.all.count == 0, 'DB have registers. Make sure to clean DB before run tests, and it has ' + ExpaPerson.all.count.to_s)
    assert(ExpaApplication.all.count == 0, 'DB have registers. Make sure to clean DB before run tests, and it has ' + ExpaApplication.all.count.to_s)

    params = {'per_page' => 100, 'filters[status]' => 'in progress'}
    people = EXPA::Peoples.list_by_param(params)

    for person in people do
      applications = EXPA::Peoples.get_applications(person.id)
      break unless applications.empty? || applications.count == 0
    end

    xp_sync = ExpaRdSync.new
    xp_sync.update_db_peoples(person)

    assert(ExpaPerson.all.count == 1, 'DB should have only 1 register, but it has ' + ExpaPerson.all.count.to_s)
    assert(ExpaApplication.all.count == applications.count, 'DB should have ' + applications.count.to_s + ' registers , but it has ' + ExpaApplication.all.count.to_s)
  end

  def test_update_application_that_are_already_on_db
    assert(ExpaPerson.all.count == 0, 'DB have registers. Make sure to clean DB before run tests, and it has ' + ExpaPerson.all.count.to_s)
    assert(ExpaApplication.all.count == 0, 'DB have registers. Make sure to clean DB before run tests, and it has ' + ExpaApplication.all.count.to_s)

    params = {'per_page' => 100, 'filters[status]' => 'in progress'}
    people = EXPA::Peoples.list_by_param(params)

    for person in people do
      applications = EXPA::Peoples.get_applications(person.id)
      break unless applications.empty? || applications.count == 0
    end

    xp_sync = ExpaRdSync.new
    xp_sync.update_db_peoples(person)

    assert(ExpaPerson.all.count == 1, 'DB should have only 1 register, but it has ' + ExpaPerson.all.count.to_s)
    assert(ExpaApplication.all.count == applications.count, 'DB should have ' + applications.count.to_s + ' registers , but it has ' + ExpaApplication.all.count.to_s)
  end
end
