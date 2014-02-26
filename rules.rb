class RuleHandler
	def initialize name
		@name = name
	end
end

class PercentChange < RuleHandler
	def execute(target_val, data_hash)
		change_ratio = abs((data_hash[:previous_val] - data_hash[:current_val)/data_hash[:current_val)]
		change_ratio > target_val
	end

	def update_hash(security, current_time, interval, data_hash)
		last_update = data_hash[:last_update]
		if (last_update - current_time) > interval
			data_hash[:previous_val] = data_hash[:current_val]
			data_hash[:current_val] = security.current_price
		end
	end
end

class PlaceWithinRange < RuleHandler
end


class TradeRule
	def set_type type_handler, security_list, interval
		@type_handler = type
		@security_list = security_list
		@interval = interval
	end

	def set_active true_false
		@active = true_false
	end

	def valid?
		@type_handler.validate(....)
	end

	def execute
		@type_handler.execute(...)
	end
end

class RuleManager
	def initialize
		@rule_list = []
	end
	
	def add_rule(rule)
		@rule_list << rule
	end

	def remove_rule(rule)
		@rule_list.delete rule
	end

	def process_rules
		@rule_list.each do |rule|
			rule.execute if rule.valid?
		end
	end


	class SecurityList
		def initialize
			@list = []
		end

		def add_security sec_list_entry
		end

		def remove_sec sec_list_entry
		end
	end

	class SecurityListEntry
		attr_accessor :info
		def initialize security
			@security = security
		end
	end

	class Security
		def initialize market, ticker, longname
		end

		def current_price
		end
	end


