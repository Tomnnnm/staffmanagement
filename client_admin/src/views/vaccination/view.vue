<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','employee_job_number') || $check_field('add','employee_job_number') || $check_field('set','employee_job_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="员工工号" prop="employee_job_number">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_employee_job_number(form['employee_job_number']) }}
							<!--<el-input id="business_name" v-model="form['employee_job_number']" placeholder="请输入员工工号"-->
							<!--v-if="user_group === '管理员' || (form['vaccination_id'] && $check_field('set','employee_job_number')) || (!form['vaccination_id'] && $check_field('add','employee_job_number'))" :disabled="disabledObj['employee_job_number_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','employee_job_number')">{{form['employee_job_number']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['vaccination_id'] && $check_field('set','employee_job_number')) || (!form['vaccination_id'] && $check_field('add','employee_job_number'))" id="employee_job_number" v-model="form['employee_job_number']" :disabled="disabledObj['employee_job_number_isDisabled']">
								<el-option v-for="o in list_user_employee_job_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','employee_job_number')" id="employee_job_number" v-model="form['employee_job_number']" :disabled="true">
								<el-option v-for="o in list_user_employee_job_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="employee_job_number" v-model="form['employee_job_number']" :disabled="disabledObj['employee_job_number_isDisabled']">
							<el-option v-for="o in list_user_employee_job_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','employee_name') || $check_field('add','employee_name') || $check_field('set','employee_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="员工姓名" prop="employee_name">
					<el-input id="employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名"
							  v-if="user_group === '管理员' || (form['vaccination_id'] && $check_field('set','employee_name')) || (!form['vaccination_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','department') || $check_field('add','department') || $check_field('set','department')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="部门" prop="department">
					<el-input id="department" v-model="form['department']" placeholder="请输入部门"
							  v-if="user_group === '管理员' || (form['vaccination_id'] && $check_field('set','department')) || (!form['vaccination_id'] && $check_field('add','department'))" :disabled="disabledObj['department_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','department')">{{form['department']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','vaccination_date') || $check_field('add','vaccination_date') || $check_field('set','vaccination_date')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="接种日期" prop="vaccination_date">
					<el-date-picker :disabled="disabledObj['vaccination_date_isDisabled']" v-if="user_group === '管理员' || (form['vaccination_id'] && $check_field('set','vaccination_date')) || (!form['vaccination_id'] && $check_field('add','vaccination_date'))" id="vaccination_date"
						v-model="form['vaccination_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','vaccination_date')">{{form['vaccination_date']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','number_of_inoculation_needles') || $check_field('add','number_of_inoculation_needles') || $check_field('set','number_of_inoculation_needles')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="接种针数" prop="number_of_inoculation_needles">
					<el-select id="number_of_inoculation_needles" v-model="form['number_of_inoculation_needles']"
						v-if="user_group === '管理员' || (form['vaccination_id'] && $check_field('set','number_of_inoculation_needles')) || (!form['vaccination_id'] && $check_field('add','number_of_inoculation_needles'))">
						<el-option v-for="o in list_number_of_inoculation_needles" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','number_of_inoculation_needles')">{{form['number_of_inoculation_needles']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','vaccination_certificate') || $check_field('add','vaccination_certificate') || $check_field('set','vaccination_certificate')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="接种凭证" prop="vaccination_certificate">
					<el-upload :disabled="disabledObj['vaccination_certificate_isDisabled']" id="vaccination_certificate" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_vaccination_certificate"
						:show-file-list="false" v-if="user_group === '管理员' || (form['vaccination_id'] && $check_field('set','vaccination_certificate')) || (!form['vaccination_id'] && $check_field('add','vaccination_certificate'))">
						<img v-if="form['vaccination_certificate']" :src="$fullUrl(form['vaccination_certificate'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','vaccination_certificate')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['vaccination_certificate'])" :preview-src-list="[$fullUrl(form['vaccination_certificate'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
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
				field: "vaccination_id",
				url_add: "~/api/vaccination/add?",
				url_set: "~/api/vaccination/set?",
				url_get_obj: "~/api/vaccination/get_obj?",
				url_upload: "~/api/vaccination/upload?",

				query: {
					"vaccination_id": 0,
				},

				form: {
					"employee_job_number": 0, // 员工工号
					"employee_name":'', // 员工姓名
					"department":'', // 部门
					"vaccination_date":'', // 接种日期
					"number_of_inoculation_needles":'', // 接种针数
					"vaccination_certificate":'', // 接种凭证
					"vaccination_id": 0, // ID

				},
				disabledObj:{
					"employee_job_number_isDisabled": false,
					"employee_name_isDisabled": false,
					"department_isDisabled": false,
					"vaccination_date_isDisabled": false,
					"number_of_inoculation_needles_isDisabled": false,
					"vaccination_certificate_isDisabled": false,
				},
				// 用户列表
				list_user_employee_job_number: [],
				// 用户组
				group_user_employee_job_number: "",
				//接种针数选项列表
				list_number_of_inoculation_needles: ['第一针','第二针','第三针'],

			}
		},
		methods: {
			/**
			 * 获取员工用户用户列表
			 */
			async get_list_user_employee_job_number() {
                // if(this.user_group !== "管理员" && this.form["employee_job_number"] === 0) {
                //     this.form["employee_job_number"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=员工用户");
                if(json.result && json.result.list){
                    this.list_user_employee_job_number = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			/**
			 * 获取员工用户用户组
			 */
			async get_group_user_employee_job_number() {
				this.form["employee_job_number"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=员工用户");
				if(json.result && json.result.obj){
					this.group_user_employee_job_number = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_employee_job_number(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_employee_job_number.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
						for (let key in _this.form) {
							arrForm.push(key)
						}
						for (var i=0;i<arr.length;i++){
							for (var j=0;j<arrForm.length;j++){
								if (arr[i]===arrForm[j]){
									if (arr[i]!=="employee_job_number") {
										_this.form[arrForm[j]] = res.result.obj[arr[i]]
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
										break;
									}else {
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
									}
								}
							}
						}
					}
				});
			},
			get_user_employee_job_number(id){
				var obj = this.list_user_employee_job_number.getObj({"user_id":id});
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
			 * 上传接种凭证
			 * @param {Object} param图片参数
			 */
			upload_vaccination_certificate(param){
				this.uploadFile(param.file, "vaccination_certificate");
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
						case "员工工号":
							if(param["employee_job_number"] > 0){
								param["employee_job_number"] = this.user.user_id;
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
        if (this.form["vaccination_date"].indexOf("-")===-1){
          this.form["vaccination_date"] = this.$toTime(parseInt(this.form["vaccination_date"]),"yyyy-MM-dd")
        }
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
				if(parseInt(this.form["vaccination_date"]) > 9999){
					this.form["vaccination_date"] = this.$toTime(parseInt(this.form["vaccination_date"]),"yyyy-MM-dd")
				}

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/vaccination/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vaccination/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vaccination/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/vaccination/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/vaccination/view','get');
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
			this.get_list_user_employee_job_number();
			this.get_group_user_employee_job_number();
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
