<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','staff') || $check_field('add','staff') || $check_field('set','staff')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="员工" prop="staff">
						<el-select v-if="user_group === '管理员' || (form['employee_overtime_id'] && $check_field('set','staff')) || (!form['employee_overtime_id'] && $check_field('add','staff'))" id="staff" v-model="form['staff']" :disabled="disabledObj['staff_isDisabled']">
							<el-option v-for="o in list_user_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','staff')" id="staff" v-model="form['staff']" :disabled="true">
							<el-option v-for="o in list_user_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','overtime_date') || $check_field('add','overtime_date') || $check_field('set','overtime_date')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="加班日期" prop="overtime_date">
					<el-date-picker :disabled="disabledObj['overtime_date_isDisabled']" v-if="user_group === '管理员' || (form['employee_overtime_id'] && $check_field('set','overtime_date')) || (!form['employee_overtime_id'] && $check_field('add','overtime_date'))" id="overtime_date"
						v-model="form['overtime_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','overtime_date')">{{form['overtime_date']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','overtime_hours') || $check_field('add','overtime_hours') || $check_field('set','overtime_hours')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="加班时长" prop="overtime_hours">
					<el-input id="overtime_hours" v-model="form['overtime_hours']" placeholder="请输入加班时长"
							  v-if="user_group === '管理员' || (form['employee_overtime_id'] && $check_field('set','overtime_hours')) || (!form['employee_overtime_id'] && $check_field('add','overtime_hours'))" :disabled="disabledObj['overtime_hours_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','overtime_hours')">{{form['overtime_hours']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','closing_time') || $check_field('add','closing_time') || $check_field('set','closing_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="下班时间" prop="closing_time">
					<el-date-picker :disabled="disabledObj['closing_time_isDisabled']" v-if="user_group === '管理员' || (form['employee_overtime_id'] && $check_field('set','closing_time')) || (!form['employee_overtime_id'] && $check_field('add','closing_time'))" id="closing_time"
						v-model="form['closing_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','closing_time')">{{form['closing_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "employee_overtime_id",
				url_add: "~/api/employee_overtime/add?",
				url_set: "~/api/employee_overtime/set?",
				url_get_obj: "~/api/employee_overtime/get_obj?",
				url_upload: "~/api/employee_overtime/upload?",

				query: {
					"employee_overtime_id": 0,
				},

				form: {
					"staff": 0, // 员工
					"overtime_date":'', // 加班日期
					"overtime_hours":'', // 加班时长
					"closing_time":'', // 下班时间
					"employee_overtime_id": 0, // ID

				},
				disabledObj:{
					"staff_isDisabled": false,
					"overtime_date_isDisabled": false,
					"overtime_hours_isDisabled": false,
					"closing_time_isDisabled": false,
				},
				// 用户列表
				list_user_staff: [],

			}
		},
		methods: {
			/**
			 * 获取员工用户用户列表
			 */
			async get_list_user_staff() {
                // if(this.user_group !== "管理员" && this.form["staff"] === 0) {
                //     this.form["staff"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=员工用户");
                if(json.result && json.result.list){
                    this.list_user_staff = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			get_user_staff(id){
				var obj = this.list_user_staff.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				/**
				* 请求列表前
				* @param {Object} param
				*/
				var user_group = this.user.user_group;
				if (user_group !== "管理员") {
					switch (user_group) {
						case "员工":
							if(param["staff"] > 0){
								param["staff"] = this.user.user_id;
							}
							break;
					}
				}
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
        if (this.form["overtime_date"].indexOf("-")===-1){
          this.form["overtime_date"] = this.$toTime(parseInt(this.form["overtime_date"]),"yyyy-MM-dd")
        }
				this.form["closing_time"] = this.$toTime(parseInt(this.form["closing_time"]),"yyyy-MM-dd hh:mm:ss")
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
				if(parseInt(this.form["overtime_date"]) > 9999){
					this.form["overtime_date"] = this.$toTime(parseInt(this.form["overtime_date"]),"yyyy-MM-dd")
				}
				if(parseInt(this.form["closing_time"]) > 9999){
					this.form["closing_time"] = this.$toTime(parseInt(this.form["closing_time"]),"yyyy-MM-dd hh:mm:ss")
				}

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/employee_overtime/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_overtime/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_overtime/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_overtime/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_overtime/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
			this.get_list_user_staff();
		}
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
