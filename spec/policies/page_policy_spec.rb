require 'rails_helper'
require 'spec_helper'

describe PagePolicy do
  subject { PagePolicy.new(user, page) }

  let(:page) { Page.create }

  context "being a standard user" do
    let(:user) { User.create(role: 0) }

    it { should permit_action(:show)    }
    it { should permit_action(:create)  }
    it { should permit_action(:new)     }
    it { should permit_action(:update)  }
    it { should permit_action(:edit)    }
    it { should permit_action(:destroy) }
  end

  context "being a premium user" do
    let(:user) { User.create(role: 1) }

    it { should permit_action(:show)    }
    it { should permit_action(:create)  }
    it { should permit_action(:new)     }
    it { should permit_action(:update)  }
    it { should permit_action(:edit)    }
    it { should permit_action(:destroy) }
  end

  context "being an administrator" do
    let(:user) { User.create(role: 2) }

    it { should permit_action(:show)    }
    it { should permit_action(:create)  }
    it { should permit_action(:new)     }
    it { should permit_action(:update)  }
    it { should permit_action(:edit)    }
    it { should permit_action(:destroy) }
  end
end

# Permit Matchers
#
# permit_action(:action_name) Tests that the action, passed in as a parameter, is permitted by the policy.
# permit_new_and_create_actions Tests that both the new and create actions are permitted by the policy.
# permit_edit_and_update_actions Tests that both the edit and update actions are permitted by the policy.
# permit_mass_assignment_of(:attribute_name) Tests that mass assignment of the attribute, passed in as a parameter, is permitted by the policy.
#
# Forbid Matchers
#
# forbid_action(:action_name) Tests that the action, passed in as a parameter, is not permitted by the policy.
# forbid_new_and_create_actions Tests that both the new and create actions are not permitted by the policy.
# forbid_edit_and_update_actions Tests that both the edit and update actions are not permitted by the policy.
# forbid_mass_assignment_of(:attribute_name) Tests that mass assignment of the attribute, passed in as a parameter, is not permitted by the policy.
