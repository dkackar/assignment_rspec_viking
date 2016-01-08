require 'viking'

describe "Viking" do 
  
  let(:viking){ Viking.new }
  let(:uzi){ Weapon.new("Uzi") }
  let(:bow){ Bow.new(0) }
  let(:bazooka){ Weapon.new("bazooka", 100) }
  let(:viking_new){ Viking.new("Bob", 50, 5, uzi) }
  let(:viking_bow){ Viking.new("BowBob", 50, 10, bow) }
  let(:gun){ Weapon.new("Gun") }


  describe "setting attributes" do

    it "sets a new name" do

      expect(viking_new.name).to eq("Bob")

    end

    it "sets a new health" do

      expect(viking_new.health).to eq(50)

    end

    it "can't set new health after its initialized" do

      expect{viking_new.health = 100}.to raise_error(NoMethodError)

    end

    it "sets weapon as nil by default" do

      expect(viking.weapon).to eq(nil)

    end

  end

  describe "#pick_up_weapon" do

    it "changes weapon when using pick up method" do
      viking.pick_up_weapon(gun)
      expect(viking.weapon).to eq(gun)

    end

    it "throws error when picking up non-weapon" do
      
      expect{viking.pick_up_weapon("not weapon")}.to raise_error(Exception)

    end

    it "changes weapon when using pick up method" do
      viking.pick_up_weapon(gun)
      viking.pick_up_weapon(uzi)
      expect(viking.weapon).to eq(uzi)

    end

  end

  describe "#drop_weapon" do

    it "sets weapon to nil when weapon is dropped" do

      viking_new.drop_weapon
      expect(viking_new.weapon).to eq(nil)

    end

  end

  describe "#receive_attack" do

    it "reduces vikings health by a specified amount" do 

      viking_new.receive_attack(5)
      expect(viking_new.health).to eq(45)

    end

    it "receives the take damage method" do

      expect(viking_new).to receive(:take_damage).with(5).and_return(45)

      viking_new.receive_attack(5)

    end

  end

  describe "#attack" do

    it "reduces target vikings health" do

      viking.attack(viking_new)
      expect(viking_new.health).to be < 50

    end

    it "causes targets take_damage method to be called" do

      expect(viking_new).to receive(:take_damage).and_return(true)

      viking.attack(viking_new)

    end

    it "attacks with fist when no weapon given" do

      expect(viking).to receive(:damage_with_fists).and_return(5)

      viking.attack(viking_new)

    end

    it "with no weapon attacks with strength x fist multiplier" do

      viking.attack(viking_new)

      expect(viking_new.health).to eq(47.5)

    end

    it "attacks with weapon when weapon given" do

      expect(viking_new).to receive(:damage_with_weapon).and_return(5)

      viking_new.attack(viking)

    end

    it "with weapon, attacks with strength x weapon multiplier" do

      viking_bow.attack(viking)

      expect(viking.health).to eq(97.5)

    end

  end

  describe "kill a viking" do

    it "should raise an error when killing a viking" do
      viking.pick_up_weapon(bazooka)
      expect{viking.attack(viking_bow)}.to raise_error("BowBob has Died...")
    end

  end


end